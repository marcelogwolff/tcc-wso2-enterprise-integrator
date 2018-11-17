<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:pes="http://www.godinhowolff.com.br/PessoaService/"
	xmlns:tem="http://tempuri.org/">
	<xsl:param name="AuthenticationTokenId" />
	<xsl:param name="cnpjEmpresa" />
	<xsl:param name="codigoConfiguracao" />
	<xsl:output method="xml"  encoding="UTF-8" indent="yes" />
	<xsl:template match="/" exclude-result-prefixes="pes" >
		<tem:Integrar>
			<tem:request>
				<tem:AuthenticationTokenId>
					<xsl:value-of select="$AuthenticationTokenId" />
				</tem:AuthenticationTokenId>
				<tem:Pessoa>
					<tem:CnpjEmpresa><xsl:value-of select="$cnpjEmpresa" /></tem:CnpjEmpresa>
					<tem:CodigoConfiguracao><xsl:value-of select="$codigoConfiguracao" /></tem:CodigoConfiguracao>
					<tem:CamposAdicionais>
						<tem:CampoIntegracao>
							<tem:CampoReferencia>SIGLA</tem:CampoReferencia>
							<tem:Nome>PAISNASCIMENTO</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:paisNascimento" />
							</tem:Valor>
						</tem:CampoIntegracao>
						<tem:CampoIntegracao>
							<tem:Nome>NASCIMENTO</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:dataNascimento" />
							</tem:Valor>
						</tem:CampoIntegracao>
						<tem:CampoIntegracao>
							<tem:Nome>SEXO</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:genero" />
							</tem:Valor>
						</tem:CampoIntegracao>
						<tem:CampoIntegracao>
							<tem:Nome>MAE</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:nomeMae" />
							</tem:Valor>
						</tem:CampoIntegracao>
						<xsl:if
							test="pes:pessoa_fisica_nacional/pes:nomePai != ''">
							<tem:CampoIntegracao>
								<tem:Nome>PAI</tem:Nome>
								<tem:Valor>
									<xsl:value-of
										select="pes:pessoa_fisica_nacional/pes:nomePai" />
								</tem:Valor>
							</tem:CampoIntegracao>
						</xsl:if>
						<tem:CampoIntegracao>
							<tem:CampoReferencia>NOME</tem:CampoReferencia>
							<tem:Nome>ESTADOCIVIL</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:estadoCivil" />
							</tem:Valor>
						</tem:CampoIntegracao>
						<tem:CampoIntegracao>
							<tem:CampoReferencia>NOME</tem:CampoReferencia>
							<tem:Nome>MUNICIPIONASCIMENTO</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:municipioNascimento" />
							</tem:Valor>
						</tem:CampoIntegracao>
						<tem:CampoIntegracao>
							<tem:CampoReferencia>SIGLA</tem:CampoReferencia>
							<tem:Nome>ESTADONASCIMENTO</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:siglaEstadoNascimento" />
							</tem:Valor>
						</tem:CampoIntegracao>
						<tem:CampoIntegracao>
							<tem:Nome>IDENTIDADE</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:rg" />
							</tem:Valor>
						</tem:CampoIntegracao>
						<tem:CampoIntegracao>
							<tem:Nome>ORGAOEMISSOR</tem:Nome>
							<tem:Valor>
								<xsl:value-of
									select="pes:pessoa_fisica_nacional/pes:orgaoEmissorRg" />
							</tem:Valor>
						</tem:CampoIntegracao>
					</tem:CamposAdicionais>
					<tem:Apelido>
						<xsl:value-of
							select="pes:pessoa_fisica_nacional/pes:nome" />
					</tem:Apelido>
					<xsl:choose>
						<xsl:when
							test="pes:pessoa_fisica_nacional/pes:funcaoPessoaFisica = 'Cliente'">
							<tem:EhCliente>true</tem:EhCliente>
						</xsl:when>
						<xsl:otherwise>
							<tem:EhCliente>false</tem:EhCliente>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:choose>
						<xsl:when
							test="pes:pessoa_fisica_nacional/pes:funcaoPessoaFisica = 'Fornecedor'">
							<tem:EhFornecedor>true</tem:EhFornecedor>
						</xsl:when>
						<xsl:otherwise>
							<tem:EhFornecedor>false</tem:EhFornecedor>
						</xsl:otherwise>
					</xsl:choose>
					<tem:Emails>
						<xsl:for-each
							select="pes:pessoa_fisica_nacional/pes:emails/pes:email">
							<tem:EmailPessoaLayout>
								<tem:CnpjEmpresa><xsl:value-of select="$cnpjEmpresa" /></tem:CnpjEmpresa>
								<tem:CodigoConfiguracao><xsl:value-of select="$codigoConfiguracao" /></tem:CodigoConfiguracao>
								<tem:Email>
									<xsl:value-of select="pes:endereco" />
								</tem:Email>
								<tem:TipoEmail>
									<xsl:value-of select="pes:tipo" />
								</tem:TipoEmail>
							</tem:EmailPessoaLayout>
						</xsl:for-each>
					</tem:Emails>
					<tem:Enderecos>
						<xsl:for-each
							select="pes:pessoa_fisica_nacional/pes:enderecos/pes:endereco">
							<tem:EnderecoPessoaLayout>
								<tem:CnpjEmpresa><xsl:value-of select="$cnpjEmpresa" /></tem:CnpjEmpresa>
								<tem:CodigoConfiguracao><xsl:value-of select="$codigoConfiguracao" /></tem:CodigoConfiguracao>
								<tem:Bairro>
									<xsl:value-of select="pes:bairro" />
								</tem:Bairro>
								<tem:CaixaPostal>
									<xsl:value-of select="pes:caixaPostal" />
								</tem:CaixaPostal>
								<tem:Cep>
									<xsl:value-of select="pes:cep" />
								</tem:Cep>
								<tem:Complemento>
									<xsl:value-of select="pes:complemento" />
								</tem:Complemento>
								<tem:Logradouro>
									<xsl:value-of select="pes:logradouro" />
								</tem:Logradouro>
								<tem:NomeMunicipio>
									<xsl:value-of select="pes:municipio" />
								</tem:NomeMunicipio>
								<tem:NumeroLogradouro>
									<xsl:value-of select="pes:numero" />
								</tem:NumeroLogradouro>
								<tem:SiglaEstado>
									<xsl:value-of select="pes:siglaEstado" />
								</tem:SiglaEstado>
								<tem:SiglaPais>
									<xsl:value-of select="pes:siglaPais" />
								</tem:SiglaPais>
								<tem:TipoEndereco><xsl:choose><xsl:when test="pes:tipo = 'Cobrança'">Cobranca</xsl:when><xsl:otherwise><xsl:value-of select="pes:tipo" /></xsl:otherwise></xsl:choose></tem:TipoEndereco>
								<xsl:choose>
									<xsl:when test="pes:tipoLogradouro = 'Aeroporto'">
										<tem:TipoLogradouro>1</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Alameda'">
										<tem:TipoLogradouro>2</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Área'">
										<tem:TipoLogradouro>3</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Avenida'">
										<tem:TipoLogradouro>4</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Campo'">
										<tem:TipoLogradouro>5</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Chácara'">
										<tem:TipoLogradouro>6</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Colônia'">
										<tem:TipoLogradouro>7</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Condomínio'">
										<tem:TipoLogradouro>8</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Conjunto'">
										<tem:TipoLogradouro>9</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Distrito'">
										<tem:TipoLogradouro>10</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Esplanada'">
										<tem:TipoLogradouro>11</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Estação'">
										<tem:TipoLogradouro>12</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Estrada'">
										<tem:TipoLogradouro>13</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Favela'">
										<tem:TipoLogradouro>14</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Fazenda'">
										<tem:TipoLogradouro>15</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Feira'">
										<tem:TipoLogradouro>16</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Jardim'">
										<tem:TipoLogradouro>17</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Ladeira'">
										<tem:TipoLogradouro>18</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Lago'">
										<tem:TipoLogradouro>19</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Lagoa'">
										<tem:TipoLogradouro>20</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Largo'">
										<tem:TipoLogradouro>21</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Loteamento'">
										<tem:TipoLogradouro>22</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Morro'">
										<tem:TipoLogradouro>23</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Outros'">
										<tem:TipoLogradouro>24</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Parque'">
										<tem:TipoLogradouro>25</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Passarela'">
										<tem:TipoLogradouro>26</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Pátio'">
										<tem:TipoLogradouro>27</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Praça'">
										<tem:TipoLogradouro>28</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Quadra'">
										<tem:TipoLogradouro>29</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Recanto'">
										<tem:TipoLogradouro>30</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Residencial'">
										<tem:TipoLogradouro>31</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Rodovia'">
										<tem:TipoLogradouro>32</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Rua'">
										<tem:TipoLogradouro>33</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Setor'">
										<tem:TipoLogradouro>34</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Sítio'">
										<tem:TipoLogradouro>35</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Travessa'">
										<tem:TipoLogradouro>36</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Trecho'">
										<tem:TipoLogradouro>37</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Trevo'">
										<tem:TipoLogradouro>38</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Vale'">
										<tem:TipoLogradouro>39</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Vereda'">
										<tem:TipoLogradouro>40</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Via'">
										<tem:TipoLogradouro>41</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Viaduto'">
										<tem:TipoLogradouro>42</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Viela'">
										<tem:TipoLogradouro>43</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Vila'">
										<tem:TipoLogradouro>44</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Praia'">
										<tem:TipoLogradouro>45</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Núcleo'">
										<tem:TipoLogradouro>46</tem:TipoLogradouro>
									</xsl:when>
									<xsl:when test="pes:tipoLogradouro = 'Calçada'">
										<tem:TipoLogradouro>47</tem:TipoLogradouro>
									</xsl:when>
								</xsl:choose>
							</tem:EnderecoPessoaLayout>
						</xsl:for-each>
					</tem:Enderecos>
					<tem:Nome>
						<xsl:value-of
							select="pes:pessoa_fisica_nacional/pes:nome" />
					</tem:Nome>
					<tem:NumeroDocumento>
						<xsl:value-of
							select="pes:pessoa_fisica_nacional/pes:cpf" />
					</tem:NumeroDocumento>
					<tem:Telefones>
						<xsl:for-each
							select="pes:pessoa_fisica_nacional/pes:telefones/pes:telefone">
							<tem:TelefonePessoaLayout>
								<tem:CnpjEmpresa><xsl:value-of select="$cnpjEmpresa" /></tem:CnpjEmpresa>
								<tem:CodigoConfiguracao><xsl:value-of select="$codigoConfiguracao" /></tem:CodigoConfiguracao>
								<tem:CamposAdicionais>
									<tem:CampoIntegracao>
										<tem:Nome>DDD</tem:Nome>
										<tem:Valor>
											<xsl:value-of select="pes:ddd" />
										</tem:Valor>
									</tem:CampoIntegracao>
								</tem:CamposAdicionais>
								<tem:Telefone>
									<xsl:value-of select="pes:telefone" />
								</tem:Telefone>
								<tem:Tipo>
									<xsl:value-of select="pes:tipo" />
								</tem:Tipo>
							</tem:TelefonePessoaLayout>
						</xsl:for-each>
					</tem:Telefones>
				</tem:Pessoa>
			</tem:request>
		</tem:Integrar>
	</xsl:template>
</xsl:stylesheet>