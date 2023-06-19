import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function POST(req: NextRequest) {
  const login = await req.json();
  const { email, password } = login;

  let user = await prisma.user.findFirst({
    where: {
      email: email,
      password: password,
    },
  });

  if (!user) {
    user = await prisma.user.create({
      data: {
        email: email,
        password: password,
      },
    });
  }
  const res = NextResponse.redirect(new URL("/", req.url));
  res.cookies.set("userId", user.id);

  console.log("returning", res.cookies.getAll());

  return res;
}
