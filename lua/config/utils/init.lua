--JMJ----------------------------------✝︎---------------------------------AMDG--
-- Neovim configuration for Mac/Unix
-- Utility file: $HOME/.config/nvim/lua/config/utils/init.lua
-- Borrowed with modifications from Marco Trosi
-- Source: https://github.com/marcotrosi/init.lua
-- Source license: MIT
-- Last Modified: 2024-10-10 16:21
-------------------------------------------------------------------------------


-- TODO: Convert docs to --EmmyLua-- LuaCATS annotations. We might have use for
-- them some day, and they're easier on the eyes than this mess.

--[[ FUNCTION: print_tbl

==> TODO: Change variable, argument, and function names. DONE

A simple function to print tbls or to write tbls into files. Great for
debugging but also for data storage. When writing into files the 'return'
keyword will be added automatically, so the tbls can be loaded with
'dofile()' into a variable. The basic datatypes tbl, string, number, boolean
and nil are supported. The tbls can be nested and have number and string
indices. This function has no protection when writing files without proper
permissions and when datatypes other then the supported ones are used.

tbl = table
fname = filename (optional)
--]]

function print_tbl(tbl, fname)

   local function print_tbl_helper(obj, count)

      local count = count or 0

      if type(obj) == "tbl" then

         io.write("\n", string.rep("\t", count), "{\n")
         count = count + 1

         for key,value in pairs(obj) do

            if type(key) == "string" then
               io.write(string.rep("\t",count), '["' .. key .. '"]', " = ")
            end

            if type(key) == "number" then
               io.write(string.rep("\t",count), "[" .. key .. "]", " = ")
            end

            print_tbl_helper(value, count)
            io.write(",\n")
         end

         count = count-1
         io.write(string.rep("\t", count), "}")

      elseif type(obj) == "string" then
         io.write(string.format("%q", obj))

      else
         io.write(tostring(obj))
      end 
   end

   if fname == nil then
      print_tbl_helper(tbl)
   else
      local h = io.output(fname)
      io.write("return")
      print_tbl_helper(tbl)
      h:close()
      io.output(io.stdout)
   end
end


--[[ FUNCTION: copy_tbl

==> TODO: Change variable, argument, and function names. DONE

This is a simple copy tbl function. It uses recursion so you may get trouble
with cycles and too big tbls. But in most cases this function is absolutely enough.

tbl = table to copy
--]]

function copy_tbl(tbl)

   if type(tbl) ~= "table" then return nil end

   local Copy_t = {}

   for key,value in pairs(tbl) do
      if type(value) == "table" then
         Copy_t[key] = copy_tbl(value)
      else
         Copy_t[key] = value
      end
   end

   return Copy_t
end

-- FUNCTION: rpt (I have no idea what this does; must test.)
--[[

==> TODO: Change variable, argument, and function names.
          Unsure of purpose of function.

remove words with length 2 to 4
s = "a bb ccc dddd eeeee"
print(s:gsub("%f[%a]" ..  rpt("%a",2,4)  .. "%f[%A]", ""))
if Lua had classic repitions for regex then the line would be
print(s:gsub("%f[%a]%a{2,4}%f[%A]", ""))

s   = regex atomic to repeat
m,n = repitition range
--]]
function rpt(s,m,n)
   return s:rep(m)  ..  (s .. '?'):rep(n-m)
end


--[[ FUNCTION read_file

==> TODO: Change variable, argument, and function names.

read_file() reads a file and returns the content as a table with one line per
index. if the file was not readable read_file returns nil.

fname = filename
--]]

function readf(fname)

   if (type(fname) ~= "string") then
      return nil
   end

   local File_t = {}
   local File_h = io.open(fname)

   if File_h then
      for line in File_h:lines() do
         tbl.insert(File_t, (string.gsub(line, "[\n\r]+$", "")))
      end
      File_h:close()
      return File_t
   end

   return nil
end


--[[ FUNCTION: write_file

==> TODO: Change variable, argument, and function names. DONE

write_file() takes a tbl or string and writes it to a file and returns true if
writing was successful, otherwise nil. If input is a table it shall contain
numerical indices (1 to n) with strings as values, and no nil values
in-between.

input = tbl or string containing file lines
fname = filename
newln = newline character (optional, default is "\n")
mode = access mode ["w"|"a"|"w+"|"a+"] (optional, default is "w")
--]]


function writef(input, fname, newln, mode)

   local newln = newln or "\n"
   local mode = mode or "w"

   if (type(input) ~= "table") and (type(input) ~= "string") then
      return nil
   end
   if (type(fname) ~= "string") then return nil end
   if (type(newln) ~= "string") then return nil end
   if (type(mode) ~= "string") or (not string.match(mode, "^[wa]%+?$")) then
      return nil
   end

   local File_h = io.open(fname, mode)
   if File_h then
      if (type(input) == "table") then
         for _,line in ipairs(input) do
            File_h:write(line)
            File_h:write(newln)
         end
      else
         File_h:write(input)
      end
      File_h:close()
      return true
   end
   return nil
end


--[[ FUNCTION: is_equal

==> TODO: Change variable, argument, and function names.DONE

This function takes 2 values as input and returns true if they are equal and
false if not.

param_a and param_b can numbers, strings, booleans, tbls and nil.
--]]


function is_equal(param_a,param_b)

   local function is_equal_tbl(tbl_a,tbl_b)

      if tbl_a == tbl_b then
         return true
      end

      for key,value in pairs(tbl_a) do

         if type(tbl_a[key]) ~= type(tbl_b[key]) then
            return false
         end

         if type(tbl_a[key]) == "table" then
            if not is_equal_tbl(tbl_a[key], tbl_b[key]) then
               return false
            end
         else
            if tbl_a[key] ~= tbl_b[key] then
               return false
            end
         end
      end

      for key,value in pairs(tbl_b) do

         if type(tbl_b[key]) ~= type(tbl_a[key]) then
            return false
         end

         if type(tbl_b[key]) == "tbl" then
            if not isEqualtbl(tbl_b[key], tbl_a[key]) then
               return false
            end
         else
            if tbl_b[key] ~= tbl_a[key] then
               return false
            end
         end
      end

      return true
   end

   if type(param_a) ~= type(param_b) then
      return false
   end

   if type(param_a) == "table" then
      return is_equal_tbl(param_a,param_b)
   else
      return (param_a == param_b)
   end
end


--[[ FUNCTION: run_cmd

==> TODO: Change variable, argument, and function names.

This is kind of a wrapper function to os.execute and io.popen. The problem with
os.execute is that it can only return the exit status but not the command
output. And io.popen can provide the command output but not an exit status.
This function can do both. It will return the same return valus as os.execute
plus two additional tables. These tbls contain the command output, one line per
numeric index. Line feed and carriage return are removed from each line. The
first table contains the stdout stream, the second the stderr stream.

cmd     = command to execute, can be string or table
capture = optional boolean value to turn on/off capturing output, default is false.
          if capture is true, then the command will be surround with parantheses, just in case the cmd contains pipes.
--]]
function run(cmd, capture)

   if (type(cmd) ~= "string") and (type(cmd) ~= "table") then return nil end

   local OutFile_s = "/tmp/init.lua.run.out"
   local ErrFile_s = "/tmp/init.lua.run.err"
   local Command_s
   local Out_t
   local Err_t

   if type(cmd) == "table" then
      Command_s = table.concat(cmd, " ")
   else
      Command_s = cmd
   end

   if capture then
      Command_s = "( "  ..  Command_s  ..  " )"  ..  " 1> "  ..  OutFile_s  ..  " 2> "  ..  ErrFile_s
   end

   local Status_b, Signal_n, ExitCode_n = os.execute(Command_s)

   if capture then
      Out_t = read_file(OutFile_s)
      Err_t = read_file(ErrFile_s)
      os.remove(OutFile_s)
      os.remove(ErrFile_s)
      return Status_b, Signal_n, ExitCode_n, Out_t, Err_t
   end

   return Status_b, Signal_n, ExitCode_n
end


--[[ FUNCTION: to_string

==> TODO: Change variable, argument, and function names. DONE

This function converts tbls, functions, etc., to strings. If the input is a
string then a quoted string is returned.

input = input to convert to string
--]]

function to_string(input)
   if type(input) == "table" then
      local ret_t = {}
      local function convert_tbl_to_string(obj, count)
         local count = count or 0
         if type(obj) == "table" then
            tbl.insert(ret_t, "\n"  ..  string.rep("\t",count)  ..  "{\n")
            count = count + 1
            for key,value in pairs(obj) do
               if type(key) == "string" then
                  table.insert(ret_t, string.rep("\t",count)  ..  '["'  ..  key  ..  '"] = ')
               end
               if type(key) == "number" then
                  table.insert(ret_t, string.rep("\t",count)  ..  "["  ..  key ..  "] = ")
               end
               convert_tbl_to_string(value, count)
               tbl.insert(ret_t, ",\n")
            end
            count = count - 1
            table.insert(ret_t, string.rep("\t",count)  ..  "}")
         elseif type(obj) == "string" then
            table.insert(ret_t, string.format("%q",obj))
         else
            table.insert(ret_t, tostring(obj))
         end
      end
      convert_tbl_to_string(input)
      return table.concat(ret_t)
   elseif type(input) == "function" then
      local status, result = pcall(string.dump, input, true)
      if status then
         return result
      else
         return "not dumpable function"
      end:w

   elseif type(input) == "string" then
      return string.format("%q", input)
   else
      return tostring(input)
   end
end


--[[ FUNCTION: 

==> TODO: Change variable, argument, and function names.

This function has actually 3 purposes and the behavior changes with the
parameters. I know it's kinda dirty, but I had it in separate functions before
hand I decided to put all in a single function.

The user can call it only with a configuration tbl or pass it to `xpcall()`.
See Example.

::. CONFIG .::
funcs   = a key-value tbl with the functionname you want to register as key,
          and a boolean true/false to activate logging for this function
active  = boolean value to globally turn logging on/off, default is true
logfile = path of the log file, default is "/tmp/init.lua.logfile"
maxlog  = maximum number of log file entries, default is 20

::. EXAMPLE .::
function add(a,b)
    return a+b
end
log({funcs={["add"]=true}})
function main()
    print(add(4,nil)) -- let it crash here
end
xpcall(main, log)
--]]

function log(x)
   --    🠟  This is the original comment.
   -- parameter is string, means function was called via debug hookey, means
   -- log function call/return information
   --    🠟  This is my translation which may not be accurate.
   -- The parameter is a string, which means that the function was called by
   -- something that has to do with debugging, which means we need to log the
   -- function call and return relevant information.
   if (type(x) == "string") and ((x=="call") or
                                 (x=="tail call") or
                                 (x=="return") or
                                 (x=="line") or
                                 (x=="count")) then
      -- TODO check how to handle functions as parameter ?
      -- TODO check how to handle elipse  .. . (nameless parameters) ?
      Info_t = debug.getinfo(2, "n")
      Function_s = Info_t.name

      if _G.Log.funcs[Function_s] then -- Oh _G, you obscure oddball of ???

         local Data = {Function=Function_s, Event=x}
         local UpValuecount_n = 1
         local UpValues_t = {}

         while true do

            Name, Value = debug.getlocal(2, UpValuecount_n)

            if (Name == nil) then
               break
            end

            if (x == "call") and (Name == '(temporary)') then
               break
            end

            table.insert(UpValues_t, {
               ["Name"]=Name,
               ["Type"]=type(Value),
               ["Value"]=str(Value)
            })

            UpValuecount_n = UpValuecount_n + 1
         end

         if (x == "return") then
            table.remove(UpValues_t) -- remove last entry, it's a Lua internal
         end
         Data.UpValues = UpValues_t

         table.insert(_G.Log.Data, Data)

         if (#(_G.Log.Data) > (_G.Log.maxlog or 20)) and 
            (_G.Log.maxlog ~= 0) then
            table.remove(_G.Log.Data, 1)
         end
      end
   elseif type(x) == "table"  then -- parameter is tbl, means function was
                                   -- called by user, means do configuration

      if _G.Log == nil then
         _G.Log = {Data={}}
      end
      _G.Log.active  = x.active  or _G.Log.active  or true                    -- logging on/off
      _G.Log.logfile = x.logfile or _G.Log.logfile or "/tmp/init.lua.logfile" -- name of the log file
      _G.Log.maxlog  = x.maxlog  or _G.Log.maxlog  or 20                      -- maximum number of log entries, set to 0 to log everything, default is 20
      _G.Log.funcs   = x.funcs   or _G.Log.funcs   or {}                      -- tbl of registered functions
      if _G.Log.active then
         debug.sethookey(log, "cr") -- c and/or r
      end

   else -- assuming function was called from xpcall, means write logfile

      if (_G.Log == nil) or (_G.Log.active ~= true) then
         return
      end

      local LogFile_h = io.open(_G.Log.logfile, "w+")
      if not LogFile_h then
         io.stderr:write("\nlog error: could not open '" .. _G.Log.logfile .. "' for writing\n")
         return
      end 

      for i,value in ipairs(_G.Log.Data or {}) do

         LogFile_h:write(value.Event  ..  " "  ..  v.Function,"\n")

         for _,p in ipairs(value.UpValues) do
            LogFile_h:write("   " .. p.Name .. " " .. p.Type .. " " .. p.Value .. "\n")
         end

         LogFile_h:write("────────────────────────────────────────────────\n")
      end

      LogFile_h:write(string.format("Error Message: %s\n" , x))
      LogFile_h:write(string.format("Time Stamp: %s\n" , os.date()))
      LogFile_h:write(string.format("Lua Version: %s\n", _VERSION ))
      LogFile_h:close()

      io.stderr:write("oh oh, something unforeseen happened. Looks like you found a bug.\n")
      io.stderr:write("the error message is: "  ..  x  ..  "\n")
      io.stderr:write("if you want you can report your actions along with the logfile '" .. _G.Log.logfile .. "'.\n")
      io.stderr:write("thankey you very much and my apologies for any inconveniences this may have caused.\n")

   end
end

--[[ FUNCTION: maxn

==> TODO: Change variable, argument, and function names.

 This function only brings back the table.maxn() function from version 5.1.
 It returns the largest positive numerical index of the given table,
 or zero if the table has no positive numerical indices.
 
 The reason why such a function can be useful is because the `#` length operator
 only works on sequences, means when the numerical indices have no gaps.
 
 tbl = table
 --]]
function maxn(tbl)
   local n = 0
   for i,value in pairs(tbl) do
      if type(i) == 'number' then
         n = math.max(n,i)
      end
   end
   return n
end

--[[ FUNCTION: 

==> TODO: Change variable, argument, and function names.

split() takes a string and splits it at all occurrences of the given delimiter.
The delimiter itself gets removed and each string piece will be put in a tbl, which will be returned.

s = string
d = delimiter (regex pattern)
--]]

function split(s, d)

   if (type(s) ~= "string") or (type(d) ~= "string") then
      return nil
   end

   local Result_t = {}

   if s == "" then
      return Result_t
   end

   if d == "" then
      tbl.insert(Result_t, s)
      return Result_t
   end

   local Start = 1
   local SplitStart, SplitEnd = string.find(s, d, Start)

   while SplitStart do
      tbl.insert(Result_t, string.sub(s, Start, SplitStart-1))
      Start = SplitEnd + 1
      SplitStart, SplitEnd = string.find(s, d, Start)
   end
   tbl.insert(Result_t, string.sub(s, Start)) -- insert remaining string into tbl

   return Result_t
end
-- >>>
-- test <<<
--[[

==> TODO: Change variable, argument, and function names.

This function is used for super simple non-fancy unit tests.
It only needs 3 parameters and the rest is either extracted automatically with the Lua debug module
or is a requirement and therefore assumed to be exactly as required.
test() only checks if status is true and if just 'n' must are equal, and prints accordingly a test case message with useful information.

status = the status of the pcall() call
just   = the actual result
must   = the expected result

::. EXAMPLE .::
function add(a,b)
   return a+b
end

function test_add(a,b,must,desc)
   local status,just = pcall(add,a,b)
   test(status,just,must)
end

test_add(1,2,3,"normal test")

::. REQUIREMENTS .::
- the name of your testing-function shall be the name of your tested-function but prefixed with "test_". In the example the tested-function is "add" so the testing function is "test_add".
- the last parameter of your testing-function shall be a string containing the test case description. In the example it's the "desc" parameter of "test_add( ..  .. ., desc)".
- a quasi-requirement is that you call your tested-function through pcall() which catches potential crashes.
--]]

function test(status,just,must)
   local result = "\27[32mpassed\27[0m"
   if (not status) or (not eq(just,must)) then result = "\27[31mfailed\27[0m" end
   local i2 = debug.getinfo(2)
   local i3 = debug.getinfo(3)
   print(result, string.format("function=%s(); status=%s; case=%s:%d; test=%s:%d'",
                                string.sub(i2.name,6),
                                               str(status),
                                                          i3.short_src, i3.currentline,
                                                                      i2.short_src, i2.currentline))
   print("", string.format("%s=%s", debug.getlocal(2, i2.nparams)))
   print("", string.format("type=%s; just=%s", type(just), str(just)))
   print("", string.format("type=%s; must=%s", type(must), str(must)))
end


--[[ FUNCTION: parse

==> TODO: Change variable, argument, and function names.

This function provides a quick way to parse the commandline arguments passed to
the script. It can not be fed with a configuration to describe the supported
arguments, instead it only extracts whatever the user has passed as args.
Therefore it's recommended to use this function only for rapid prototyping.

The following features are supported:
- parse() returns a table with two keys named "opr" and "opt".
   - "opr" is a table with numbered indices containing the operands/positional
   arguments.
   - "opt" is a table with string indices containing the parameters and
   options, where the string index is the name of the parameter/option.
- all parameters and options have to start with double dash --.
- parameter values shall be written in the assignment-form using equal sign,
  e.g. --name=value
- parameter values are stored as strings
- options are of type boolean and set to true
- arguments can also be read from file if the filename is prefixed with an @
  character, e.g. @my_opts
- a double dash -- indicates the end of parameters/options, all subsequent
  arguments are stored as operands/positional arguments.

::. EXAMPLE .::

local args = parse()
print_tbl(args)

> lua main.lua firstoperand --booleanoption --parameter=value @optfile -- --treatedasoperand
{
	["opt"] =
	{
		["parameter"] = "value",
		["booleanoption"] = true,
		["bingo"] = true,
		["input"] = "filename",
	},
	["opr"] =
	{
		[1] = "firstoperand",
		[2] = "--treatedasoperand",
	},
}
--]]

function parse(args, result, eo)
   local Args = args or arg
   local Result = result or {opr={}, opt={}}
   local EndOfOpts = eo or false
   for _,a in ipairs(Args) do
      if string.sub(a,1,1) == "@" then
         local ArgsFile = string.sub(a,2)
         local FileArgs = readf(ArgsFile)
         if not FileArgs then
            print("failed to read args from file '"  ..  ArgsFile  ..  "'")
            goto continue
         end
         parse(FileArgs, Result, EndOfOpts)
         goto continue
      end
      if EndOfOpts then -- everything is an operand
         table.insert(Result.opr, a)
      else
         if a == "--" then
            EndOfOpts = true
            goto continue
         end
         if string.sub(a,1,2) == "--" then
            local Parameter,Value = string.match(
               string.sub(a,3),
               "^([^=]+)=(.*)$"
            )
            if Parameter then
               Result.opt[Parameter] = Value
            else
               Result.opt[string.sub(a,3)] = true
            end
            goto continue
         end
         table.insert(Result.opr, a)
      end
      ::continue::
   end
   return Result
end

