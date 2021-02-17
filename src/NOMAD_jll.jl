# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule NOMAD_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("NOMAD")
JLLWrappers.@generate_main_file("NOMAD", UUID("2fc7fd02-576c-576e-a36a-6afce71715da"))
end  # module NOMAD_jll
