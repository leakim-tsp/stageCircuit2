#######################################################################################
# The algorithm takes as an input                                                     #
# (1) the number of loops l in a perfectly nested, permutable loop nest;              #
# (2) a tile size (scalar) s;                                                         #
# (3) a scattering function that maps some input space into a 2l+1 output space ;     #
# (4) a loop depth d ;                                                                #
# (3) is in fact given by iscc analysis                                               #
#######################################################################################

import sys
import os

class Iscc :
    """string builder of an iscc script"""
    def __init__(self, c_file):
        self.string = """P := parse_file "{}" ;\nD := P[0] ;\noriginal_schedule := map(P[4]) ;\n""".format(c_file)
        self.SEP = ";\n"
        self.ASSIGN_SYM = ":="
        self.TO = "->"
        self.var = 0 # number of assigned schedules

    def statement(self, a) :
        self.string += a + " " + self.SEP
        
    def assign(self, a, b) :
        self.statement(a + " " + self.ASSIGN_SYM + " " + b)

    def com(self, comment) :
        self.string += "# " + comment + "\n"

    def tuple(self, l) :
        return "[" + ", ".join(l)+ "]"
    
    def schedule(self, l1, l2, conditions="") :
        statement_conditions = ""
        if conditions != "" :
            statement_conditions = ": " + conditions
        schedule_name = "schedule_" + str(self.var)
        self.assign(schedule_name, "{ " + self.tuple(l1) + " " + self.TO + " " + self.tuple(l2) + statement_conditions + " }")
        self.var += 1
        return schedule_name

    def codegen(self, schedule_name, domain_name) :
        self.statement("codegen(" + schedule_name + " * " + domain_name + ")")

    def save(self, path) :
        with open(path, "w") as fich :
            fich.write(self.string)


def stripe_mining(v, i, stripe_size, iscc) :
    """stripe mining of loop number i of iteration vector v"""
    stripe_index = "t" + v[i]
    y = v[:i] + [stripe_index] + v[i:]    
    conditions = "{0} mod {1} = 0 and  {0} <= {2} < {0} + {1}".format(stripe_index, stripe_size, v[i])
    iscc.com("stripe mining {} loop".format(v[i]))
    return iscc.schedule(v, y, conditions), y

def interchange(v, l, d, iscc) :
    """interchange loop (of depth >= d) of iteration vector v to finalize tiling"""
    y = v[:d] + ["tc" + str(i) for i in range(d, l)] + ["c" + str(i) for i in range(d, l)]
    iscc.com("interchange")
    return iscc.schedule(v, y)
    
    
def tiling(d, l, s, iscc) :
    """d : depth, l : number of loops, s : tile size"""
    iscc.com(" square tiling  of size {} at depth {}".format(s, d))
    schedules = [] # schedules to apply succesively to original schedule
    iteration_vector = ["c" + str(i) for i in range(l)] # iteration vector
    offset = 0
    # succesive stripe mining schedules
    for loop_index in range(d, l) :
        schedule, iteration_vector = stripe_mining(iteration_vector, loop_index + offset, s, iscc)
        offset += 1
        schedules.append(schedule)
    # interchange
    schedules.append(interchange(iteration_vector, l, d, iscc))
    iscc.com("compose stripe minings and interchange")
    n_closing_par = len(schedules)
    final_schedule = ""
    while schedules != [] :
        final_schedule += schedules.pop() + "("
    final_schedule +=  "original_schedule" + n_closing_par * ")"
    iscc.assign("tiling_schedule", final_schedule)
    iscc.codegen("tiling_schedule", "D")

# todo
# une passe de iscc -> schedule pour compute
# Insert copy-in code for all read references
# Insert copy-out code for all written references
# Update the tile body to correctly index the local buffers
# Compute the buffer sizes -> Hint: this is the max of the number of data points communicated
# reindex local buffer




if __name__ == "__main__" :

    ##################################################################
    # usage                                                          #
    # python tiling.py c_file_name depth number_of_loops stripe_size #
    # where depth is the loop number where tiling must start         #
    ##################################################################
    
    c_file = sys.argv[1]
    d = int(sys.argv[2])
    l = int(sys.argv[3])
    s = int(sys.argv[4])
    iscc = Iscc(c_file)
    tiling(d, l, s, iscc)
    iscc.save(c_file + ".iscc")
    os.system("iscc < " + c_file + ".iscc")
