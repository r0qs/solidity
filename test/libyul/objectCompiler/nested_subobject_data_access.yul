object "A" {
    code {
        sstore(0, datasize("B.C"))
        sstore(1, datasize("B.C.dataC1"))
        sstore(2, datasize("B.C.dataC2"))
    }

    data "dataA1" "abcdef"
    data "dataA2" "123"

    object "B" {
        code {
            sstore(0, datasize("B"))
            sstore(1, datasize("dataB1"))
            sstore(2, datasize("dataB2"))
        }

        data "dataB1" "abcdef"
        data "dataB2" "123"

        object "C" {
            code {
                sstore(0, datasize("dataC1"))
            }

            data "dataC1" hex"AA"
            data "dataC2" "00"
        }
    }
}
// ----
// Assembly:
//     /* "source":42:57   */
//   dataSize(sub_0.sub_0)
//     /* "source":39:40   */
//   0x00
//     /* "source":32:58   */
//   sstore
//     /* "source":77:99   */
//   dataSize(sub_0.sub_0)
//     /* "source":74:75   */
//   0x01
//     /* "source":67:100   */
//   sstore
//     /* "source":119:141   */
//   dataSize(sub_0.sub_0)
//     /* "source":116:117   */
//   0x02
//     /* "source":109:142   */
//   sstore
// stop
// data_64e604787cbf194841e7b68d7cd28786f6c9a0a3ab9f8b0a0e87cb4387ab0107 313233
// data_acd0c377fe36d5b209125185bc3ac41155ed1bf7103ef9f0c2aff4320460b6df 616263646566
//
// sub_0: assembly {
//         /* "source":256:269   */
//       bytecodeSize
//         /* "source":253:254   */
//       0x00
//         /* "source":246:270   */
//       sstore
//         /* "source":293:311   */
//       0x06
//         /* "source":290:291   */
//       0x01
//         /* "source":283:312   */
//       sstore
//         /* "source":335:353   */
//       0x03
//         /* "source":332:333   */
//       0x02
//         /* "source":325:354   */
//       sstore
//     stop
//     data_64e604787cbf194841e7b68d7cd28786f6c9a0a3ab9f8b0a0e87cb4387ab0107 313233
//     data_acd0c377fe36d5b209125185bc3ac41155ed1bf7103ef9f0c2aff4320460b6df 616263646566
//
//     sub_0: assembly {
//             /* "source":492:510   */
//           0x01
//             /* "source":489:490   */
//           0x00
//             /* "source":482:511   */
//           sstore
//         stop
//         data_db81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365 aa
//         data_e3f0ae350ee09657933cd8202a4dd563c5af941f8054e6d7191e3246be378290 3030
//     }
// }
// Bytecode: 600660005560066001556006600255fe
// Opcodes: PUSH1 0x6 PUSH1 0x0 SSTORE PUSH1 0x6 PUSH1 0x1 SSTORE PUSH1 0x6 PUSH1 0x2 SSTORE INVALID
// SourceMappings: 42:15:0:-:0;39:1;32:26;77:22;74:1;67:33;119:22;116:1;109:33
