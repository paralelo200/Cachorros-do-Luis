<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Galeria de Cachorros</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Segoe UI", sans-serif;
    }

    body {
      background: #f3f4f6;
      color: #111;
    }

    header {
      background: #4f46e5;
      color: white;
      padding: 20px;
      text-align: center;
    }

    .container {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 20px;
      padding: 20px;
    }

    .card {
      background: white;
      border-radius: 16px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      padding: 16px;
      transition: transform 0.3s;
    }

    .card:hover {
      transform: scale(1.02);
    }

    .card h3 {
      margin-bottom: 10px;
      font-size: 1.2rem;
      color: #4f46e5;
    }

    .button {
      margin-top: 10px;
      background: #4f46e5;
      color: white;
      border: none;
      padding: 10px 16px;
      border-radius: 12px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .button:hover {
      background: #3730a3;
    }

    footer {
      background: #111827;
      color: white;
      text-align: center;
      padding: 20px;
      margin-top: 40px;
    }

    .contact-btn {
      margin-top: 10px;
      background: #10b981;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 12px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s;
    }

    .contact-btn:hover {
      background: #059669;
    }
  </style>
</head>
<body>

  <header>
    <h1>🐶 Galeria de Cachorros</h1>
    <p>Veja algumas raças incríveis!</p>
  </header>

  <div class="container" id="dog-gallery"></div>

  <footer>
    <h2>Contato</h2>
    <p>📞 Telefone: 98 8502-5644</p>
    <button class="contact-btn" onclick="contatar()">CONTATAR</button>
  </footer>

  <script>
    const dogs = [
      { nome: "Golden Retriever", desc: "Cachorro amigável, ideal para famílias." },
      { nome: "Pastor Alemão", desc: "Excelente cão de guarda e inteligente." },
      { nome: "Labrador Retriever", desc: "Muito dócil, ótimo com crianças." },
      { nome: "Poodle", desc: "Extremamente inteligente e elegante." },
      { nome: "Bulldog Francês", desc: "Pequeno, musculoso e adorável." },
      { nome: "Beagle", desc: "Curioso, feliz e energético." },
      { nome: "Dálmata", desc: "Conhecido pelas manchas pretas e personalidade vibrante." },
      { nome: "Shih Tzu", desc: "Pequeno e calmo, perfeito para apartamento." },
      { nome: "Chow Chow", desc: "Visual único e leal." },
      { nome: "Husky Siberiano", desc: "Ativo, independente e bonito." }
    ];

    const gallery = document.getElementById("dog-gallery");

    dogs.forEach(dog => {
      const card = document.createElement("div");
      card.className = "card";
      card.innerHTML = `
        <h3>${dog.nome}</h3>
        <p>${dog.desc}</p>
        <button class="button">Ver mais</button>
      `;
      gallery.appendChild(card);
    });

    function contatar() {
      window.open("https://wa.me/559885025644", "_blank");
    }
  </script>

</body>
</html>