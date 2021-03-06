local config = require("lapis.config")
local sql_password, session_secret
do
  local _obj_0 = require("secret")
  sql_password, session_secret = _obj_0.sql_password, _obj_0.session_secret
end
config("development", function()
  port(8080)
  secret("fake")
  session_name("fake_net_dev")
  num_workers(1)
  code_cache("off")
  measure_performance(true)
  return postgres(function()
    host("127.0.0.1")
    user("postgres")
    password(sql_password)
    return database("fake_net_dev")
  end)
end)
return config("production", function()
  port(80)
  secret(session_secret)
  session_name("fake_net")
  num_workers(3)
  code_cache("on")
  measure_performance(false)
  return postgres(function()
    host("127.0.0.1")
    user("postgres")
    password(sql_password)
    return database("fake_net")
  end)
end)
