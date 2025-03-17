document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("form");

    form.addEventListener("submit", async (event) => {
        event.preventDefault();

        // Pegando valores dos inputs
        const nome = document.querySelector("#form_name input").value;
        const email = document.querySelector("#form_email input").value;
        const cpf = document.querySelector("#form_cpf input").value;
        const celular = document.querySelector("#form_celular input").value;
        const senha = document.querySelector("#form_senha input").value;
        const senha2 = document.querySelector("#form_senha:nth-of-type(2) input").value;

        // Verifica se as senhas coincidem
        if (senha !== senha2) {
            alert("As senhas não coincidem!");
            return;
        }

        const formData = {
            nome: nome,
            email: email,
            cpf: cpf, 
            celular: celular,
            senha: senha
        };

        try {
            const response = await fetch("http://localhost:3321/user", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(formData),
            });

            if (!response.ok) {
                throw new Error("Erro ao cadastrar usuário!");
            }

            alert("Cadastro realizado com sucesso!");
            form.reset(); // Limpa os campos do formulário
            window.location.href = "index.html"; // Redireciona para a tela de login
        } catch (error) {
            console.error("Erro ao cadastrar usuário:", error);
            alert("Erro ao cadastrar usuário. Verifique os dados e tente novamente.");
        }
    });
});

// ////////

// document.addEventListener("DOMContentLoaded", () => {
//     const addForm = document.querySelector(".add-form");

//     addForm.addEventListener("submit", async (event) => {
//         event.preventDefault();

//         const inputName = document.querySelector(".input-name").value;
//         const inputDate = document.querySelector(".input-date").value;
//         const inputTime = document.querySelector(".input-time").value;
//         const inputDescription = document.querySelector(".input-description").value;
//         const inputLocal = document.querySelector(".input-local").value;
//         const inputTag = document.querySelector(".input-tag").value;

//         const formData = {
//             nome: inputName,
//             dia: inputDate,
//             hora: inputTime,
//             descricao: inputDescription,
//             local: inputLocal,
//             tag: inputTag || null, // Caso seja opcional
//             idUsuarioPai: '1'
//         };

//         try {
//             const response = await fetch("http://localhost:3321/role", {
//                 method: "POST",
//                 headers: {
//                     "Content-Type": "application/json",
//                 },
//                 body: JSON.stringify(formData),
//             });

//             if (!response.ok) {
//                 throw new Error("Erro ao cadastrar evento!");
//             }

//             alert("Evento cadastrado com sucesso!");
//             addForm.reset(); // Limpa o formulário após o cadastro
//         } catch (error) {
//             console.error("Erro ao enviar evento:", error);
//             alert("Erro ao cadastrar evento. Verifique os dados e tente novamente.");
//         }
//     });
// });