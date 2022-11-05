local status_ok, cursor = pcall(require, "mini.cursorword")

if not status_ok then
  return
end

cursor.setup()

