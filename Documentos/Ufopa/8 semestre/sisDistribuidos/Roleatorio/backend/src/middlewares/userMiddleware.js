const validateField = (fieldName) => {
    return (request, response, next) => {

        const {body} = request;

        if(body[fieldName ]=== undefined) {
            return response.status(400).json({message: `É necessário inserir um "${fieldName}"`});
        }

        if(body[fieldName] === '') {
            return response.status(400).json({message: `"${fieldName}" não pode ficar vazio`});
        }

        next();
        
    }
}  

 
module.exports = {
    validateUserName: validateField("nome"),
    validateUserCpf: validateField("cpf"),
    validateUserCel: validateField("celular"),
    validateUserPass: validateField("senha")
};