import { prisma } from "@/lib/prisma";
import Nav from "./Nav";
import { GetServerSidePropsContext } from "next";
import { User } from "@prisma/client";
import { cookies } from "next/headers";
import { Library } from "./Library";

export default async function Home() {
  const books = await prisma.book.findMany();
  const magazines = await prisma.magazine.findMany();
  const movies = await prisma.movie.findMany();

  const cookieStore = cookies();
  let user: User | null;
  let loanedItems = [];
  if (cookieStore.get("userId")?.value) {
    user = await prisma.user.findUnique({
      where: {
        id: cookieStore.get("userId")?.value,
      },
    });
    loanedItems = await prisma.loan.findMany({
      where: {
        userId: user?.id,
      },
    });
  } else {
    user = null;
  }

  return (
    <>
      <Nav user={user} />
      <main className="mx-8">
        {user ? (
          <Library
            books={books}
            magazines={magazines}
            movies={movies}
            userId={user.id}
          />
        ) : (
          <Library books={books} magazines={magazines} movies={movies} />
        )}
        {user && loanedItems.length ? (
          <p>{loanedItems.length} Loaned Items</p>
        ) : (
          <p>No Loaned Items</p>
        )}
      </main>
    </>
  );
}
