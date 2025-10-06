import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";

export const authApp = new Hono();

authApp.post("/register", async (c) => {
  const { email, password } = await c.req.json();
  const supabase = c.get("supabase");
  const response = await supabase.auth.signUp({ email, password });
  if (response.error) {
    throw new HTTPException(400, {
      res: c.json({ error: response.error.message }, 400),
    });
  }

  return c.json(response.data.user, 200);
});
