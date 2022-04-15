import redgpu
import Glibc

func debugCallback(_ severity: RedDebugCallbackSeverity, _ types: RedDebugCallbackTypeBitflags, _ data: UnsafePointer<RedDebugCallbackData>?, _ context: RedContext?) -> RedBool32 {
  if let d = data {
    let message = String(cString: d[0].message)
    print(message)
  }
  return 0
}

let contextExtensions = [RED_SDK_EXTENSION_WSI_XLIB.rawValue]
var context: RedContext! = nil
var contextStatuses = RedStatuses()
redCreateContext(malloc, free, nil, nil, debugCallback, RED_SDK_VERSION_1_0_135, UInt32(contextExtensions.count), contextExtensions, nil, 0, nil, 0, nil, &context, &contextStatuses, nil, 0, nil)

print(contextStatuses)
assert(context != nil)

for i in 0 ..< Int(context[0].gpusCount) {
  let gpu = context[0].gpus[i]
  print(gpu)
}
