# general zlib constants, definitions

_zlib = dlopen("libz")

# Constants

# Flush values
const Z_NO_FLUSH       = int32(0)
const Z_PARTIAL_FLUSH  = int32(1)
const Z_SYNC_FLUSH     = int32(2)
const Z_FULL_FLUSH     = int32(3)
const Z_FINISH         = int32(4)
const Z_BLOCK          = int32(5)
const Z_TREES          = int32(6)

# Return codes
const Z_OK             = int32(0)
const Z_STREAM_END     = int32(1)
const Z_NEED_DICT      = int32(2)
const Z_ERRNO          = int32(-1)
const Z_STREAM_ERROR   = int32(-2)
const Z_DATA_ERROR     = int32(-3)
const Z_MEM_ERROR      = int32(-4)
const Z_BUF_ERROR      = int32(-5)
const Z_VERSION_ERROR  = int32(-6)


# Zlib errors as Exceptions
zerror(e::Integer) = bytestring(ccall(dlsym(_zlib, :zError), Ptr{Uint8}, (Int32,), e))
type ZError <: Exception
    err::Int32
    err_str::String

    ZError(e::Integer) = (e == Z_ERRNO ? new(e, strerror()) : new(e, zerror(e)))
end

# Compression Levels
const Z_NO_COMPRESSION      = int32(0)
const Z_BEST_SPEED          = int32(1)
const Z_BEST_COMPRESSION    = int32(9)
const Z_DEFAULT_COMPRESSION = int32(-1)

# Compression Strategy
const Z_FILTERED             = int32(1)
const Z_HUFFMAN_ONLY         = int32(2)
const Z_RLE                  = int32(3)
const Z_FIXED                = int32(4)
const Z_DEFAULT_STRATEGY     = int32(0)

# data_type field
const Z_BINARY    = int32(0)
const Z_TEXT      = int32(1)
const Z_ASCII     = Z_TEXT
const Z_UNKNOWN   = int32(2)

# deflate compression method
const Z_DEFLATED    = int32(8)

# misc
const Z_NULL   = C_NULL

# Constants for use with gzbuffer
const Z_DEFAULT_BUFSIZE = 8192

# Constants for use with gzseek
const SEEK_SET = int32(0)
const SEEK_CUR = int32(1)
