import { Hono } from "hono";
import { HTTPException } from "hono/http-exception";
import { registerValidator } from "../validators/authValidators.js";

export const authApp = new Hono();

authApp.post("/login", async (c) => {
  const { email, password } = await c.req.json();
  const supabase = c.get("supabase");
  const { data, error } = await supabase.auth.signInWithPassword({
    email,
    password,
  });

  if (error) {
    throw new HTTPException(400, {
      res: c.json({ error: "Invalid credentials" }, 400),
    });
  }

  return c.json(data.user, 200);
});

authApp.post("/register", registerValidator, async (c) => {
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

authApp.post("/refresh", async (c) => {
  const supabase = c.get("supabase");
  const { data, error } = await supabase.auth.refreshSession();

  if (error) {
    throw new HTTPException(401, {
      res: c.json({ error: "Unable to refresh session" }, 401),
    });
  }

  return c.json(
    {
      user: data.user,
      session: data.session,
    },
    200
  );
});

authApp.post("/logout", async (c) => {
  const supabase = c.get("supabase");
  const { error } = await supabase.auth.signOut();

  if (error) {
    throw new HTTPException(400, {
      res: c.json({ error: "Unable to sign out" }, 400),
    });
  }

  return c.json({ message: "Successfully logged out" }, 200);
});
