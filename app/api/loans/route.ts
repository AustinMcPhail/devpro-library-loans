import { prisma } from "@/lib/prisma";
import { NextRequest, NextResponse } from "next/server";

export async function POST(req: NextRequest) {
  const userId = req.cookies.get("userId");

  if (!userId) return NextResponse.redirect(new URL("/", req.url));

  const { materialId, materialTypeId } = await req.json();

  const materialType = await prisma.materialType.findFirst({
    where: {
      id: materialTypeId,
    },
  });

  if (!materialType) throw new Error("Material type not found");

  const loan = await prisma.loan.create({
    data: {
      userId: userId.value,
      materialId,
      materialTypeId: materialType.id,
      dueDate: new Date(
        Date.now() + materialType.daysCanBeLoaned * 24 * 60 * 60 * 1000
      ),
    },
  });

  return NextResponse.json({ loan });
}

export async function GET(req: NextRequest) {
  const userId = req.cookies.get("userId");
  if (!userId) return NextResponse.redirect(new URL("/", req.url));

  const loans = await prisma.loan.findMany({
    where: {
      userId: userId.value,
    },
    include: {
      materialType: true,
    },
  });
}
