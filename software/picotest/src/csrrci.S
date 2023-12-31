#include "riscv_test.h"
#include "test_macros.h"
#include "test_macros_csr.h"

.text
.global csrrci
csrrci:
TEST_CSRI_OP(0, csrrci, 0x11, 0x13, 0xe, mepc, x28)
TEST_CSRI_OP(1, csrrci, 0x10, 0x1c, 0xc, mtvec, x15)
TEST_CSRI_OP(2, csrrci, 0x0, 0x9, 0x9, mstatus, x25)
TEST_CSRI_OP(3, csrrci, 0x8, 0xc, 0x4, mtvec, x11)
TEST_CSRI_OP(4, csrrci, 0x8, 0x18, 0x10, mepc, x12)
TEST_CSRI_OP(5, csrrci, 0x10, 0x10, 0x3, mepc, x21)
TEST_CSRI_OP(6, csrrci, 0x10, 0x18, 0xc, mtvec, x6)
TEST_CSRI_OP(7, csrrci, 0x10, 0x1c, 0xf, mepc, x30)
TEST_CSRI_OP(8, csrrci, 0x1, 0x1b, 0x1e, mepc, x23)
TEST_CSRI_OP(9, csrrci, 0x0, 0x8, 0x19, mepc, x20)
TEST_CSRI_OP(10, csrrci, 0x3, 0x13, 0x14, mepc, x12)
TEST_CSRI_OP(11, csrrci, 0x6, 0x6, 0x1, mcause, x28)
TEST_CSRI_OP(12, csrrci, 0x9, 0x9, 0x0, mcause, x13)
TEST_CSRI_OP(13, csrrci, 0x0, 0x9, 0xb, mcause, x9)
TEST_CSRI_OP(14, csrrci, 0x0, 0x1b, 0x1f, mepc, x26)
TEST_CSRI_OP(15, csrrci, 0x6, 0x17, 0x11, mstatus, x8)
TEST_CSRI_OP(16, csrrci, 0x0, 0x10, 0x1c, mtvec, x30)
TEST_CSRI_OP(17, csrrci, 0x4, 0xc, 0x1a, mstatus, x17)
TEST_CSRI_OP(18, csrrci, 0x0, 0x8, 0xe, mstatus, x5)
TEST_CSRI_OP(19, csrrci, 0x0, 0x8, 0xb, mcause, x29)
TEST_CSRI_OP(20, csrrci, 0x0, 0x1, 0xf, mcause, x7)
TEST_CSRI_OP(21, csrrci, 0x10, 0x13, 0xb, mstatus, x9)
TEST_CSRI_OP(22, csrrci, 0x2, 0xa, 0x9, mepc, x22)
TEST_CSRI_OP(23, csrrci, 0x0, 0xe, 0xf, mstatus, x14)
TEST_CSRI_OP(24, csrrci, 0xa, 0xb, 0x1, mcause, x11)
TEST_CSRI_OP(25, csrrci, 0x10, 0x12, 0xe, mstatus, x26)
TEST_CSRI_OP(26, csrrci, 0x0, 0x8, 0xc, mcause, x9)
TEST_CSRI_OP(27, csrrci, 0x11, 0x13, 0x6, mepc, x20)
TEST_CSRI_OP(28, csrrci, 0x0, 0x10, 0x18, mtvec, x16)
TEST_CSRI_OP(29, csrrci, 0x4, 0x14, 0x10, mtvec, x7)

TEST_CSRI_BYPASS(30, csrrci, 0x18, 0x18, 0x0, mtvec, x3, 0)
TEST_CSRI_BYPASS(31, csrrci, 0x0, 0x0, 0xe, mcause, x8, 1)
TEST_CSRI_BYPASS(32, csrrci, 0x0, 0x1b, 0x1f, mstatus, x14, 2)
TEST_CSRI_BYPASS(33, csrrci, 0x0, 0x2, 0x12, mepc, x21, 3)
TEST_CSRI_BYPASS(34, csrrci, 0xa, 0x1f, 0x15, mepc, x22, 4)
TEST_CSRI_BYPASS(35, csrrci, 0x0, 0x8, 0xb, mcause, x30, 5)

TEST_CSRI_ZERO_DEST(36, csrrci, 0x4, 0x19, mstatus)
TEST_CSRI_ZERO_DEST(37, csrrci, 0x2, 0x1b, mstatus)
TEST_CSRI_ZERO_DEST(38, csrrci, 0x15, 0x1b, mepc)
TEST_CSRI_ZERO_DEST(39, csrrci, 0x1b, 0x1a, mepc)

TEST_PASSFAIL
