let { DirectPinKey, PhysicalEncoder, .. } = import "fak/keyboard.ncl" in
let { CH552G, .. } = import "fak/mcus.ncl" in

{
  mcu = CH552G,
  usb_dev = {
    vendor_id = 51966,  # 0xCAFE
    product_id = 47806, # 0xBABE
    product_ver = 256,  # 0x0100
  },
  encoders = [
    PhysicalEncoder 31 30 2,
  ],
  keys =
    let D = DirectPinKey in
    [
        D 11, D 17, D 16,
        D 15, D 14, D 32,
        D 33
    ]
}