import React from "react";
import { createRoot } from "react-dom/client";

function App() {
  const apiUrl = import.meta.env.VITE_API_URL || "http://localhost:8080";

  return (
    <main style={{ fontFamily: "Arial, sans-serif", padding: "40px" }}>
      <h1>StartTech MuchTodo</h1>
      <p>Frontend deployed with AWS S3 and CloudFront.</p>
      <p>Backend API: {apiUrl}</p>
    </main>
  );
}

createRoot(document.getElementById("root")).render(<App />);
