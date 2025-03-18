document.addEventListener("DOMContentLoaded", () => {
    const addForm = document.querySelector(".add-form");

    addForm.addEventListener("submit", async (event) => {
        event.preventDefault();

        const inputName = document.querySelector(".input-name").value;
        const inputDate = document.querySelector(".input-date").value;
        const inputTime = document.querySelector(".input-time").value;
        const inputDescription = document.querySelector(".input-description").value;
        const inputLocal = document.querySelector(".input-local").value;
        const inputTag = document.querySelector(".input-tag").value;

        const formData = {
            nome: inputName,
            dia: inputDate,
            hora: inputTime,
            descricao: inputDescription,
            local: inputLocal,
            tag: inputTag || null, // Caso seja opcional
            idUsuarioPai: '1'
        };

        try {
            const response = await fetch("http://localhost:3321/role", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(formData),
            });

            if (!response.ok) {
                throw new Error("Erro ao cadastrar evento!");
            }


            alert("Evento cadastrado com sucesso!");
            addForm.reset(); // Limpa o formulário após o cadastro


        } catch (error) {
            console.error("Erro ao enviar evento:", error);
            alert("Erro ao cadastrar evento. Verifique os dados e tente novamente.");
        }
    });
});
