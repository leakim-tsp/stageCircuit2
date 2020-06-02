<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="com.autoesl.autopilot.project" top="tiled_matvec">
  <files>
    <file name="../../matvec_testbecnch.cpp" sc="0" tb="1" cflags=""/>
    <file name="matvec.cpp" sc="0" tb="false" cflags="" blackbox="false"/>
    <file name="matvec.h" sc="0" tb="false" cflags="" blackbox="false"/>
    <file name="matvec_pragma.cpp" sc="0" tb="false" cflags="" blackbox="false"/>
  </files>
  <solutions>
    <solution name="no_opt" status="inactive"/>
    <solution name="Dflow_pipeline_load" status="inactive"/>
    <solution name="pipeline_compute_innermost" status="active"/>
    <solution name="pipeline_compute_outermost" status="inactive"/>
  </solutions>
  <includePaths/>
  <libraryPaths/>
  <Simulation>
    <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
  </Simulation>
</project>
