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
};  

module.exports = {
    validateEventName: validateField("nome"),
    validateEventDescricao: validateField("descricao"),
    validateEventDia: validateField("dia"),
    validateEventHora: validateField("hora"),
    validateEventLocal: validateField("local"),
    validateEventStatus: validateField("idStatus")
};