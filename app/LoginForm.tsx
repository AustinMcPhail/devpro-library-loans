"use client";

import { FormEvent, useState } from "react";

export default function LoginForm() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  function handleLogin(event: FormEvent) {
    event.preventDefault();
    fetch("/api/users", {
      method: "POST",
      body: JSON.stringify({ email, password }),
    }).then();
  }
  return (
    <form onSubmit={handleLogin} className="flex gap-4">
      <input
        type="text"
        placeholder="Email"
        name="email"
        value={email}
        onChange={(event) => setEmail(event.target.value)}
      />

      <input
        type="password"
        placeholder="Password"
        name="password"
        value={password}
        onChange={(event) => setPassword(event.target.value)}
      />
      <button type="submit">Login</button>
    </form>
  );
}
