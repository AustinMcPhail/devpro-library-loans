import { Book, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// Dune	Book	3
// All About Chrome Dragons	Magazine	1
// Hamlet	Book	4
// Lord of the Rings: Fellowship of the Rings	DVD	2
// The Devil Wears Prada	DVD	1
// The Diviners	Book	1
// The Most Refreshing Summer Cakes	Magazine	2


async function main() {
  const bookMaterial = await prisma.materialType.create({
    data: {
      name: "Book",
      daysCanBeLoaned: 14,
      lateFee: 299
    }
  });

  const magazineMaterial = await prisma.materialType.create({
    data: {
      name: "Magazine",
      daysCanBeLoaned: 9,
      lateFee: 399
    }
  });

  const dvdMaterial = await prisma.materialType.create({
    data: {
      name: "Movie",
      daysCanBeLoaned: 9,
      lateFee: 499
    }
  });

  await prisma.book.create({
    data: {
      title: "Dune",
      materialTypeId: bookMaterial.id,
      copies: 3,
      author: "Frank Herbert",
      genre: "Science Fiction",
    }
  });

  await prisma.book.create({
    data: {
      title: "Hamlet",
      materialTypeId: bookMaterial.id,
      copies: 4,
      author: "William Shakespeare",
      genre: "Tragedy",
    }
  });

  await prisma.book.create({
    data: {
      title: "The Diviners",
      materialTypeId: bookMaterial.id,
      copies: 1,
      author: "Libba Bray",
      genre: "Fantasy",
    }
  });

  await prisma.magazine.create({
    data: {
      title: "All About Chrome Dragons",
      materialTypeId: magazineMaterial.id,
      copies: 1,
      series: "Chrome Dragons",
      volume: 1,
    }
  });

  await prisma.magazine.create({
    data: {
      title: "The Most Refreshing Summer Cakes",
      materialTypeId: magazineMaterial.id,
      copies: 2,
      series: "Chrome Dragons",
      volume: 1,
    }
  });

  await prisma.movie.create({
    data: {
      title: "Lord of the Rings: Fellowship of the Rings",
      materialTypeId: dvdMaterial.id,
      copies: 2,
      director: "Peter Jackson",
      genre: "Fantasy",
    }
  });

  await prisma.movie.create({
    data: {
      title: "The Devil Wears Prada",
      materialTypeId: dvdMaterial.id,
      copies: 1,
      director: "David Frankel",
      genre: "Comedy",
    }
  });
}

main()
  .then(() => prisma.$disconnect())
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit();
  });
