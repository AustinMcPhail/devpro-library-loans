"use client";

import { User } from "@prisma/client";
import LoginForm from "./LoginForm";

export default function Nav({ user }: { user: User | null }) {
  return (
    <nav className="flex justify-between items-center px-8 mb-8">
      <h1 className="text-4xl">DevPro Library</h1>
      <ul className="flex gap-4">
        <li>
          <a href="/books">Books</a>
        </li>
        <li>
          <a href="/magazines">Magazines</a>
        </li>
        <li>
          <a href="/movies">Movies</a>
        </li>
        {!user && (
          <li>
            <LoginForm />
          </li>
        )}
        {user && <li className="text-gray-500">{user.email}</li>}
      </ul>
    </nav>
  );
}
