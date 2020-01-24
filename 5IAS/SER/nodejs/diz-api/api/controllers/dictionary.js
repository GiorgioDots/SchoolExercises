const mysqlSync = require('../utils/mysql-sync');

exports.getWords = (req, res, next) => {
    mysqlSync.performQuerySync('SELECT * FROM dictionary')
        .then(result => {
            res.status(200).json({ message: "Success", result: result.results });
        })
        .catch(error => {
            if (!error.statusCode) {
                error.statusCode = 500;
            }
            next(error);
        });
}

exports.getWord = (req, res, next) => {
    let word = req.query.q;
    console.log(word);
    mysqlSync.performQuerySync(`SELECT * FROM dictionary WHERE word = '${word}'`)
        .then(result => {
            console.log(result);
            res.status(200).json({ message: "Success", result: result.results });
        })
        .catch(error => {
            if (!error.statusCode) {
                error.statusCode = 500;
            }
            next(error);
        });
}

exports.newWord = (req, res, next) => {
    const word = req.body.word;
    const meaning = req.body.meaning;
    const synonyms = req.body.synonyms;
    const antonyms = req.body.antonyms;

    mysqlSync.performQuerySync(`INSERT INTO dictionary (word, meaning, synonyms, antonyms) VALUES ('${word}', '${meaning}', '${synonyms}', '${antonyms}')`)
        .then(result => {
            return mysqlSync.performQuerySync(`SELECT * FROM dictionary WHERE (word = '${word}' and meaning = '${meaning}' and synonyms = '${synonyms}' and antonyms = '${antonyms}')`);
        })
        .then(result => {
            res.status(200).json({ message: "Success", result: result.results[0] });
        })
        .catch(error => {
            if (!error.statusCode) {
                error.statusCode = 500;
            }
            next(error);
        });
}

exports.updateWord = (req, res, next) => {
    const id = req.body.id;
    const word = req.body.word;
    const meaning = req.body.meaning;
    const synonyms = req.body.synonyms;
    const antonyms = req.body.antonyms;

    mysqlSync.performQuerySync(`UPDATE dictionary SET word = '${word}', meaning = '${meaning}', synonyms = '${synonyms}', antonyms = '${antonyms}' WHERE id = ${id}`)
        .then(result => {
            if (!result.results.affectedRows) {
                let error = new Error('Word not found');
                error.statusCode = 404;
                throw error;
            }
            res.status(200).json({ message: "Success", result: { id: id, word: word, meaning: meaning, synonyms: synonyms, antonyms: antonyms } });
        })
        .catch(error => {
            if (!error.statusCode) {
                error.statusCode = 500;
            }
            next(error);
        });
}

exports.deleteWord = (req, res, next) => {
    const id = req.body.id;
    let wordInfo = {};
    mysqlSync.performQuerySync(`SELECT * FROM dictionary WHERE id = '${id}'`)
        .then(result => {
            wordInfo = result.results;
            return mysqlSync.performQuerySync(`DELETE FROM dictionary WHERE id = '${id}'`);
        })
        .then(result => {
            if (!result.results.affectedRows) {
                let error = new Error('Word not found');
                error.statusCode = 404;
                throw error;
            }
            res.status(200).json({ message: "Success", result: wordInfo });
        })
        .catch(error => {
            if (!error.statusCode) {
                error.statusCode = 500;
            }
            next(error);
        });
}