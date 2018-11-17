# tcc-wso2-enterprise-integrator

Script para criação do banco de dados:

````
-- SCHEMA: smart_proxy

-- DROP SCHEMA smart_proxy ;

CREATE SCHEMA smart_proxy;


-- Table: smart_proxy.smart_proxy

-- DROP TABLE smart_proxy.smart_proxy;

CREATE TABLE smart_proxy.smart_proxy
(
    id integer NOT NULL DEFAULT nextval('smart_proxy.smart_proxy_id_seq'::regclass),
    message_id character varying(100) COLLATE pg_catalog."default",
    relates_to character varying(100) COLLATE pg_catalog."default",
    reply_to character varying(1000) COLLATE pg_catalog."default",
    fault_to character varying(1000) COLLATE pg_catalog."default",
    stage character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT smart_proxy_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
````

XML gerado pelo SOAP UI usado para teste:
Caso usar o SOAP UI deve cliar na aba WS-A abaixo do request e preencher os dados referente ao Addressing. Os itens que estão no Header deste xml são gerados por esta aba.

````
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" 
    xmlns:pes="http://www.godinhowolff.com.br/PessoaService/">
   <soapenv:Header xmlns:wsa="http://www.w3.org/2005/08/addressing">
       <wsa:Action>PessoaService/inserirPessoaFisicaNacional</wsa:Action>
       <wsa:ReplyTo>
           <wsa:Address>http://localhost:8280/services/ProxyGenericoParaSimularORetorno</wsa:Address>
       </wsa:ReplyTo>
       <wsa:FaultTo>
           <wsa:Address>http://localhost:8280/services/ProxyGenericoParaSimularORetorno</wsa:Address>
       </wsa:FaultTo>
       <wsa:MessageID>uuid:fad146b3-eeef-45ac-b5ce-7cda70ca91f9</wsa:MessageID>
   </soapenv:Header>
   <soapenv:Body>
      <pes:pessoa_fisica_nacional>
         <pes:enderecos>
            <!--Zero or more repetitions:-->
            <pes:endereco>
               <pes:cep>gero et</pes:cep>
               <pes:caixaPostal>sonoras imperio</pes:caixaPostal>
               <pes:tipo>Cadastral</pes:tipo>
               <pes:tipoLogradouro>Avenida</pes:tipoLogradouro>
               <pes:numero>per auras</pes:numero>
               <pes:logradouro>circum claustra</pes:logradouro>
               <pes:complemento>nimborum in</pes:complemento>
               <pes:bairro>foedere certo</pes:bairro>
               <pes:cidade>profundum quippe ferant</pes:cidade>
               <pes:estado>et carcere</pes:estado>
               <pes:estadoSigla>iovis rapidum iaculata</pes:estadoSigla>
               <pes:pais>speluncis abdidit</pes:pais>
               <pes:paisSigla>bella gero et</pes:paisSigla>
            </pes:endereco>
         </pes:enderecos>
         <pes:emails>
            <!--Zero or more repetitions:-->
            <pes:email>
               <pes:tipo>Cadastral</pes:tipo>
               <pes:endereco>hoc metuens</pes:endereco>
            </pes:email>
         </pes:emails>
         <pes:telefones>
            <!--Zero or more repetitions:-->
            <pes:telefone>
               <pes:ddd>ac vinclis</pes:ddd>
               <pes:telefone>speluncis abdidit</pes:telefone>
               <pes:tipo>aris imponet honorem</pes:tipo>
            </pes:telefone>
         </pes:telefones>
         <pes:nome>praeterea aut</pes:nome>
         <pes:dataNascimento>2014-06-27-03:00</pes:dataNascimento>
         <pes:genero>certo et premere</pes:genero>
         <pes:estadoCivil>et montis</pes:estadoCivil>
         <pes:nomePai>feta furentibus</pes:nomePai>
         <pes:nomeMae>sed pater</pes:nomeMae>
         <pes:cpf>talia flammato secum</pes:cpf>
         <pes:rg>austris aeoliam</pes:rg>
         <pes:orgaoEmissorRg>sciret dare</pes:orgaoEmissorRg>
         <pes:paisNascimento>dare iussus</pes:paisNascimento>
         <pes:estadoNascimento>bella gero</pes:estadoNascimento>
         <pes:municipioNascimento>dedit qui foedere</pes:municipioNascimento>
      </pes:pessoa_fisica_nacional>
   </soapenv:Body>
</soapenv:Envelope>
````
