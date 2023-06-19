"use client";
import { Book, Magazine, Movie } from "@prisma/client";

export function Library({
  books,
  magazines,
  movies,
  userId,
}: {
  books: Book[];
  magazines: Magazine[];
  movies: Movie[];
  userId?: string;
}) {
  function loanItem(materialId: string, materialTypeId: string) {
    if (userId) {
      fetch("/api/loans", {
        method: "POST",
        body: JSON.stringify({
          materialId,
          materialTypeId,
        }),
      }).then((response) => {
        console.log({ response });
        if (response.ok) {
          alert("Item loaned!");
        } else {
          alert("Something went wrong!");
        }
      });
    } else {
      alert("You must be logged in to loan an item!");
    }
  }

  return (
    <>
      <section className="mb-4">
        <h2 className="text-3xl">Books</h2>
        <ul>
          {books.map((book) => (
            <li key={book.id}>
              {book.title}
              <button
                className="ml-4"
                onClick={() => loanItem(book.id, book.materialTypeId)}
              >
                Loan
              </button>
            </li>
          ))}
        </ul>
      </section>

      <section className="mb-4">
        <h2 className="text-3xl">Magazines</h2>
        <ul>
          {magazines.map((magazine) => (
            <li key={magazine.id}>
              {magazine.title}
              <button
                className="ml-4"
                onClick={() => loanItem(magazine.id, magazine.materialTypeId)}
              >
                Loan
              </button>
            </li>
          ))}
        </ul>
      </section>

      <section className="mb-4">
        <h2 className="text-3xl">Movies</h2>
        <ul>
          {movies.map((movie) => (
            <li key={movie.id}>
              {movie.title}
              <button
                className="ml-4"
                onClick={() => loanItem(movie.id, movie.materialTypeId)}
              >
                Loan
              </button>
            </li>
          ))}
        </ul>
      </section>
    </>
  );
}
