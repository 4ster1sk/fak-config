let { tap, hold, td, combo, encoder, .. } = import "fak/keycode.ncl" in

# We alias commonly used stuff, so we don't end up repeating them over and over.
let kc = tap.reg.kc in
let me = tap.custom.media in
let ms = tap.custom.mouse in
let XXXX = tap.none & hold.none in
let TTTT = tap.trans & hold.trans in

# "cu" for custom keys. This is just a name, so it can be whatever you want.
let cu = {
  # Again, these are just names. They don't have to be 4-letter or capitalized.
  #COPY = tap.reg.mod.lctl & kc.C,
  #PSTE = tap.reg.mod.lctl & kc.V,
  #CUT =  tap.reg.mod.lctl & kc.X,
  #CLOS = tap.reg.mod.lalt & kc.F4,
  #UNDO =  tap.reg.mod.lctl & kc.Z,
  #REDO =  tap.reg.mod.lctl & kc.Y,

  # mac用
  COPY = tap.reg.mod.lgui & kc.C,
  PSTE = tap.reg.mod.lgui & kc.V,
  CUT =  tap.reg.mod.lgui & kc.X,
  CLOS = tap.reg.mod.lgui & kc.Q,
  UNDO =  tap.reg.mod.lgui & kc.Z,
  REDO =  tap.reg.mod.lgui & kc.Y,

  SHT_R = tap.reg.mod.lsft & kc.R,
  L1 = hold.reg.layer 1,

  # Yep. Such names are possible in Nickel.
  ":P" = tap.reg.mod.lctl & tap.reg.mod.lalt & kc.DEL,

  # Screenshot
  SCSH = tap.reg.mod.lgui & tap.reg.mod.lsft & kc.S,
} in

# Keymap definition
{
  virtual_keys = [
    encoder.ccw 0,
    encoder.cw 0,
  ],

  layers = [
    [ # Layer 0
      kc.P, kc.X, cu.UNDO,
      cu.L1, kc.V, XXXX,
      cu.SHT_R,
      kc.MINS, kc.EQL,
      # これは動かない？謎 
      #tap.custom.mouse.UP, tap.custom.mouse.DOWN,
    ],
    [ # Layer 1
      kc.M,    XXXX,    cu.REDO,
      cu.L1,    XXXX,    XXXX,
      me.MUTE,
      me.VOLD, me.VOLU,
    ]
  ]
}
