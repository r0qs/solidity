object "A" {
    code {
        sstore(0, datasize("B"))
        sstore(1, datasize("B.data1"))
        sstore(2, datasize("B.data2"))
    }

    object "B" {
        code {
            sstore(0, datasize("B"))
            sstore(1, datasize("data1"))
            sstore(2, datasize("data2"))
        }

        data "data1" "abcdef"
        data "data2" "123"
    }
}
// ----
// Assembly:
//     /* "source":42:55   */
//   dataSize(sub_0)
//     /* "source":39:40   */
//   0x00
//     /* "source":32:56   */
//   sstore
//     /* "source":75:94   */
//   dataSize(sub_0)
//     /* "source":72:73   */
//   0x01
//     /* "source":65:95   */
//   sstore
//     /* "source":114:133   */
//   dataSize(sub_0)
//     /* "source":111:112   */
//   0x02
//     /* "source":104:134   */
//   sstore
// stop
//
// sub_0: assembly {
//         /* "source":196:209   */
//       bytecodeSize
//         /* "source":193:194   */
//       0x00
//         /* "source":186:210   */
//       sstore
//         /* "source":233:250   */
//       0x06
//         /* "source":230:231   */
//       0x01
//         /* "source":223:251   */
//       sstore
//         /* "source":274:291   */
//       0x03
//         /* "source":271:272   */
//       0x02
//         /* "source":264:292   */
//       sstore
//     stop
//     data_64e604787cbf194841e7b68d7cd28786f6c9a0a3ab9f8b0a0e87cb4387ab0107 313233
//     data_acd0c377fe36d5b209125185bc3ac41155ed1bf7103ef9f0c2aff4320460b6df 616263646566
// }
// Bytecode: 601060005560106001556010600255fe
// Opcodes: PUSH1 0x10 PUSH1 0x0 SSTORE PUSH1 0x10 PUSH1 0x1 SSTORE PUSH1 0x10 PUSH1 0x2 SSTORE INVALID
// SourceMappings: 42:13:0:-:0;39:1;32:24;75:19;72:1;65:30;114:19;111:1;104:30
