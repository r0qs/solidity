object "A" {
    code {
        sstore(0, datasize("A"))
        sstore(1, datasize("dataA1"))
        sstore(2, datasize("dataA2"))
        pop(dataoffset("B"))
        pop(datasize("B.dataB1"))
        sstore(3, calldataload(0))
        pop(dataoffset("B.C"))
        pop(datasize("B.C.dataC1"))
        sstore(4, calldataload(0))
    }

    data "dataA1" "abcdef"
    data "dataA2" "123"

    object "B" {
        code {
            sstore(0, datasize("dataB1"))
            sstore(1, datasize("dataB2"))
        }

        data "dataB1" "a"
        data "dataB2" "00"

        object "C" {
            code {
                sstore(0, datasize("dataC1"))
            }

            data "dataC1" hex"AA"
        }
    }
}
// ----
// Assembly:
//     /* "source":42:55   */
//   bytecodeSize
//     /* "source":39:40   */
//   0x00
//     /* "source":32:56   */
//   sstore
//     /* "source":75:93   */
//   0x06
//     /* "source":72:73   */
//   0x01
//     /* "source":65:94   */
//   sstore
//     /* "source":113:131   */
//   0x03
//     /* "source":110:111   */
//   0x02
//     /* "source":103:132   */
//   sstore
//     /* "source":227:228   */
//   0x00
//     /* "source":214:229   */
//   calldataload
//     /* "source":211:212   */
//   0x03
//     /* "source":204:230   */
//   sstore
//     /* "source":329:330   */
//   0x00
//     /* "source":316:331   */
//   calldataload
//     /* "source":313:314   */
//   0x04
//     /* "source":306:332   */
//   sstore
// stop
// data_64e604787cbf194841e7b68d7cd28786f6c9a0a3ab9f8b0a0e87cb4387ab0107 313233
// data_acd0c377fe36d5b209125185bc3ac41155ed1bf7103ef9f0c2aff4320460b6df 616263646566
//
// sub_0: assembly {
//         /* "source":446:464   */
//       0x01
//         /* "source":443:444   */
//       0x00
//         /* "source":436:465   */
//       sstore
//         /* "source":488:506   */
//       0x02
//         /* "source":485:486   */
//       0x01
//         /* "source":478:507   */
//       sstore
//     stop
//     data_3ac225168df54212a25c1c01fd35bebfea408fdac2e31ddd6f80a4bbf9a5f1cb 61
//     data_e3f0ae350ee09657933cd8202a4dd563c5af941f8054e6d7191e3246be378290 3030
//
//     sub_0: assembly {
//             /* "source":639:657   */
//           0x01
//             /* "source":636:637   */
//           0x00
//             /* "source":629:658   */
//           sstore
//         stop
//         data_db81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365 aa
//     }
// }
// Bytecode: 601c60005560066001556003600255600035600355600035600455fe
// Opcodes: PUSH1 0x1C PUSH1 0x0 SSTORE PUSH1 0x6 PUSH1 0x1 SSTORE PUSH1 0x3 PUSH1 0x2 SSTORE PUSH1 0x0 CALLDATALOAD PUSH1 0x3 SSTORE PUSH1 0x0 CALLDATALOAD PUSH1 0x4 SSTORE INVALID
// SourceMappings: 42:13:0:-:0;39:1;32:24;75:18;72:1;65:29;113:18;110:1;103:29;227:1;214:15;211:1;204:26;329:1;316:15;313:1;306:26
