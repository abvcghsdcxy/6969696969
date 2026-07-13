declare function loadstring(chunk: string, chunkname: string?): () -> ()
declare function load(chunk: string, chunkname: string?): () -> ()
declare function decompile(script: Instance): string
declare function WorldToScreen(position: Vector3): (Vector2, boolean)
declare function notify(message: string, title: string, duration: number)
declare function identifyexecutor(): (string, string)
declare function getscripthash(script: Instance): string
declare function getgamename(): string
declare function getscripts(): { Instance }
declare function getscriptbytecode(script: Instance): string
declare function base64encode(data: string): string
declare function base64decode(data: string): string
declare function GetPingValue(): number
declare function tick(): number

declare function getfenv(target: (...any) -> ...any | number): {}
declare function setfenv(
    f: (...any) -> (...any),
    env: {}
): (...any) -> (...any)

-- INPUT
declare function setrobloxinput(state: boolean): ()
declare function isrbxactive(): boolean
declare function setclipboard(value: string): ()
declare function keypress(keycode: number): boolean
declare function keyrelease(keycode: number): boolean
declare function iskeypressed(keycode: number): boolean
declare function ismouse1pressed(): boolean
declare function ismouse2pressed(): boolean
declare function mouse1press(): ()
declare function mouse1release(): ()
declare function mouse1click(): ()
declare function mouse2press(): ()
declare function mouse2release(): ()
declare function mouse2click(): ()
declare function mousemoveabs(x: number, y: number): ()
declare function mousemoverel(x: number, y: number): ()
declare function mousescroll(amount: number): ()

-- MISC & SCHEDULER
declare function run_secure(text: string)
declare function setfflag(FFlag: string, value: string)
declare function getfflag(FFlag: string): number
declare function require(path: string): {}
declare function wait(time: number): ()
declare function spawn(target: (...any) -> ...any): ()
declare task: {
    spawn: (target: (...any) -> ...any) -> (),
    defer: (target: (...any) -> ...any) -> (),
    delay: (time: number, target: (...any) -> ...any) -> (),
    wait: (time: number?) -> (),
}

-- MEMORY
declare function getbase(): number
declare function memory_write(memoryType: string, address: number, value: any): ()
declare function memory_read(memoryType: string, address: number): any

-- GC
export type GCValueType =
    "number"
    | "string"
    | "boolean"
    | "table"
    | "function"
    | "userdata"
    | "thread"

export type GCEntry = {
    key: string,
    value: any,
    type: GCValueType,
    addr: number,
}

declare function getgc(name: string): {GCEntry}
declare function getgc(names: {string}): {GCEntry}
declare function setgc(key: string, value: any): number
declare function setgc(values: { [string]: any }): number
declare function applygc(cache: {GCEntry}, key: string, value: any): number
declare function applygc(cache: {GCEntry}, values: { [string]: any }): number


-- FILESYSTEM
declare function writefile(path: string, content: string): nil
declare function readfile(path: string): string
declare function appendfile(path: string, content: string): nil
declare function makefolder(path: string): nil
declare function isfile(path: string): boolean
declare function isfolder(path: string): boolean
declare function listfiles(path: string): { string }
declare function delfile(path: string): boolean
declare function delfolder(path: string): boolean

declare function httpget(url: string, headers: {}?): string
declare function httppost(url: string, body: string, contentType: string?, headers: {}?): string
