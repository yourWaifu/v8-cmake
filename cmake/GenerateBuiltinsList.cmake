function(v8_generate_builtins_list target-dir target)
  set(directory ${target-dir}/builtins-generated)
  set(output ${directory}/bytecodes-builtins-list.h)
  add_custom_command(
    PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${directory}
    OUTPUT ${directory}
    COMMENT "Generating ${directory}"
    VERBATIM)
  add_custom_command(
    TARGET ${target} 
		POST_BUILD
    COMMAND bytecode_builtins_list_generator ${output}
    DEPENDS ${directory}
    COMMENT "Generating ${output}"
    VERBATIM)
  add_library(v8-bytecodes-builtin-list INTERFACE)
  target_include_directories(v8-bytecodes-builtin-list INTERFACE ${target-dir})
  target_sources(v8-bytecodes-builtin-list INTERFACE ${output})
endfunction()
