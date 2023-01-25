Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22BCC27C76
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Jan 2023 15:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSau894ZQ7j6ay0Q51MBZ1wFA1fxAMg8fR03/UIMiJE=; b=dhmXDha2oqH12W
	nLm4HUQAb/rq0hdHgCRD51dK6NEfuhISL6PsgYCJk+BqAeqgGAyskemnIhvi9PR6fra5P7YL8TnhZ
	Q01qMlQnia/Dyl7Ml9VuCzbsf7qxmftkBgqg0TarqsMzJR0pxFTQWh7ptImi6krLjFDR090ukS2gn
	Kr1bQ4/MCW3gbT/XnMAJ4M5TanTB4tKl4pB0VthLpJQO4X2nq3U0smU+cmkdcX9VNX7vy8gE9CKme
	eJnEFTOET3zt9s5MJbnYOwm2FctdKaUNEtUnFD7XilefwrSbFlSNY89/CfkBSWIwJn0NXkS31JbKv
	xF31XsWdGotWSquL9bYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKi5V-007s0f-1p; Wed, 25 Jan 2023 15:53:25 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKi5R-007rz5-OH
	for linux-snps-arc@lists.infradead.org; Wed, 25 Jan 2023 15:53:23 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PFe64r019573;
	Wed, 25 Jan 2023 07:53:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=eEyp+xLVTC+zFPZVaNXak1Vg61nDwzmG2OCbGJsyp48=;
 b=rskn2g4qRozjRKlRQvUxYpayEWvDQmqluI1opXVZUELIkHukTeHZLdWBeM70WIZu/Dj7
 ua+3X6t1WZxIm4lqqLnhVE0tVfbPCPxCuWXURkXfZAZ13ggS6cErZN4ffkQ6Amf1zmBv
 c2HTx0tfDDHbNeLaB425ltCn/gcIEpqOgV8BZqfHIKjshZd9isH2CJP04fsygAlZ+6y2
 +9M2ygPibvCECcSGDcnt8aCzjMytFmnD1GKPhTsZFtvagSsCT7HS68K33oe72x1Fia6z
 cVMLcvUrp+deUaOUVRsHN7eoR1I5xDa1Nfr7a08d/zC2FIpVTtOEgUBjiXNDed3BSw7L mg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n8fuysfq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 07:53:17 -0800
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3EF2F4011D;
	Wed, 25 Jan 2023 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1674661995; bh=eEyp+xLVTC+zFPZVaNXak1Vg61nDwzmG2OCbGJsyp48=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QUtRD8tKWpa2wdqoXMPyUMd8qAv6eea+d5ngBxUoGcpxCIeYRZ+24JbdZPjMrTXos
	 czrY3M1W6JE0d9/eVWfW75ll6x7MBonLIyD9et/soNiEtl4W89IgyCxBmd84rmCYJE
	 2iu6Et/q1emVtBnqlJOe0HJad6h6WeuC72hdIxKYsRdFRohIgJoBJ66YD1+yHl5xaS
	 7q4uaYvpbrefFNvJJtl8kjc5v3lAehV2stW+NN1zIs6UVvKXqy8v05IyLY7omp1LBv
	 0Kb/rY/sA5FMWxieHSRuAhZZkU7PHfrMGvsoupSdJ1XWrlW/fua4lA6edKLHfwPHY4
	 CBot3/DnopudA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BEF9FA005A;
	Wed, 25 Jan 2023 15:53:10 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8898B80233;
	Wed, 25 Jan 2023 15:53:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=kozlov@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="LqNrA8M/";
	dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDr2VS0b4FIhsY92HZEzI2YCvFXL/zx99h3rDxDZBaqxCVxXhhYTvLxo++RX2Evw0aEASbtpZTsQKmG7V76frHL3vT8o//Iz+mvjlkiI5U0xbk2pUozvPrCTEQHT1FDVxtn4zCjiiu8SwLqEyXFZLGkckQH7+5iD8qteMiAcwpwXWLa4ZFniVpFWCNHLSvlCk1etQ+hIFs5JV7wJ74FpOWvsMXr9ihSRkQMdwZNcP3Ek0UpVITRw5p/Ro1AMKxUt8cl+l2tHwjNafpm8Z1CkBwdUrYotrFmgdhUAYT+KzLd3AkYSy9kkBCxjLfkIzblzeKmC1SdK0xj+4NzCdwX2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEyp+xLVTC+zFPZVaNXak1Vg61nDwzmG2OCbGJsyp48=;
 b=EbiDEEC10Rip95RB9vPB1SsIdL9LjKhcFGo4V/8moBrTUWC7wb4Gvm3jY2hlfPpnYdHi94YWnQ8ooqEoNgQHmQg20A3epwnD1LZUvfOEcFj43Z5hSh3MmnGkPe6jjQ8op6G7epvtI5Ir+Ou+ni1miQ1hY6lJMcILx2o5F1p0R7ar1jf1Zz+9Y9bH2VqtJaTk/tw8DF46KM6QvXTZRnZRCRvXWU1NMe5eRMfCaox2eWM/XYfOns6ld8wCzp6nKwuv4/oU2ImWMzrLEs6snJYH1IWZ9ivb2CcK1qapevNy3G0ooHu0qFzR3jqliNZRO93jCKu0jueLCK3awdyJZkKckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEyp+xLVTC+zFPZVaNXak1Vg61nDwzmG2OCbGJsyp48=;
 b=LqNrA8M/bhoH/8iv/p8oAQNvzH03PCgduRWxLwDqmb23N9e9h6L7gbyZLNUW/SwYP2tx+n5em2Xhx3DiYv8CIV+2oAh9QNala6ma5Kbmk1mX2sLfUac43FZACzvQDF8kafSFGsYyFi/OJjMQUXijsGsosfjCuQ1ZTeC142ObbnI=
Received: from BN8PR12MB3137.namprd12.prod.outlook.com (2603:10b6:408:48::30)
 by IA1PR12MB8239.namprd12.prod.outlook.com (2603:10b6:208:3f7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:53:02 +0000
Received: from BN8PR12MB3137.namprd12.prod.outlook.com
 ([fe80::f924:a6f0:87f2:d80e]) by BN8PR12MB3137.namprd12.prod.outlook.com
 ([fe80::f924:a6f0:87f2:d80e%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 15:53:02 +0000
X-SNPS-Relay: synopsys.com
From: Pavel Kozlov <Pavel.Kozlov@synopsys.com>
To: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
CC: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] ARC: align child stack in clone
Thread-Topic: [PATCH] ARC: align child stack in clone
Thread-Index: AQHZFVgd0HVqICp9okKGKinKqaojWK6hPWSAgAF3msA=
Date: Wed, 25 Jan 2023 15:53:02 +0000
Message-ID:  <DM6PR12MB31460DCDCBE2A7E5BC4CAAF2BCC69@DM6PR12MB3146.namprd12.prod.outlook.com>
References: <20221221161946.12090-1-kozlov@synopsys.com>
 <dc4c5fb7-271f-8f97-626d-1deddcb4048a@linaro.org>
In-Reply-To: <dc4c5fb7-271f-8f97-626d-1deddcb4048a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB3137:EE_|IA1PR12MB8239:EE_
x-ms-office365-filtering-correlation-id: 7c85f69b-22f3-45fe-0749-08dafeec3da9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  eBJX7nJulYk0yAPrqYRbbrgeFgsbZis6dwTnMUu3y61Vcu/LgQnnhTGBxCMJLzoDKtiETawMORze0L6iTVEPAxBRPw7yfcAfzf+xHLn/tTUYycEcO77SRHq1LW3CZwBN6JgFznT838NVLbs6b6WxGIplCJJ6nUydOPI1Mel7z/EwR7p9Bj8LRnpJVHsWXyXBa8P+qlaLd5WIM0CQ3+BcDSmRT1Sm/nk13bI46mEMGQALZoXkBweJQ6kOn42R6auJMVH96caDBCEOSatYLunA+2KlG2uvxITgn2Ee+agf3j/cLaknk37tGXA3GqIA2NQIKE4heEzlNohth+YDMbYgYkaNblZIJAnNdEirDi33ieqGSPZcvlFq3CekHif6lvLKywhxs1acfmrTBQA7Ww8hKQ2PbkCHgHH8eqzf1uXlRSo+DlxQlVc8ogz0qH6kQJc8vANK9BZkeCgm6AbTzR4ogU6J+VMPJvLaiW2y5DpDQPXDfy9wUcHS6fgbEgi76E0UVhEFDMOydfmhOFDIEXmKMIW6fzG4G70MWacZhSOsglNC2V8TuggcnLUX2jdyznbj7I2p2P5u6LYQMM17EPg1Vrq3PVtlDWQrMb5mKfoOKK6bt1TkU7/Y23ORGgIi0aEu9P4/rLnzLZMoC/L/Y7UjaUQ6r/j7B76Q9ccfdym96Ij5kHs1UOqmoCia25hETphMRFcmQhyXt7EVkI6e9XHmQkqaWJ69OEVARQfEsHJVjIZokk9GqKgehXbWWH9Da0/GRrNUdZmguNtDxx4pHLTt9Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3137.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199018)(91956017)(6506007)(86362001)(38100700002)(26005)(966005)(186003)(478600001)(9686003)(6486002)(6512007)(71200400001)(2906002)(110136005)(316002)(38070700005)(76116006)(4326008)(66946007)(66446008)(8676002)(66556008)(5660300002)(4744005)(122000001)(66476007)(64756008)(41300700001)(33656002)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?PHx1kJ1m025xaMaQn0GmLAay2dIU4SwvJX3dt+XWI1UsTebt8eBx2hJM+/?=
 =?iso-8859-1?Q?G4pGWaFUhcU8thncIFp1UgHpFbuWFwqlgwOFdMSgjZNnqk9VFnguNOFBO2?=
 =?iso-8859-1?Q?gA1v2ax3L1LjpnrEptGXkx/0UyMXeafCiYicRxZRwv26lzmgbUQOLx2Lo/?=
 =?iso-8859-1?Q?MWbF85vkifzYCuDvIqZCU/N97EImpqDkpNDx9DeMvCeXdBW6KnCcXl9xsm?=
 =?iso-8859-1?Q?ooPeKYxFHvjETjhhNKvoicu6ORGhbe+G79k7yxuEdmjjyYGPPE5yBYFFV4?=
 =?iso-8859-1?Q?blNaalryuSuCOO53xOyczV1nLL7q+cz1r9gGQe93qSjSq7schVO6+cmxUu?=
 =?iso-8859-1?Q?iaTZDj/DnSFJlIq2gdyOwirr2DscVrVOtW44dCcPxh5kXQ019nbDMWI4CN?=
 =?iso-8859-1?Q?M2YjuRXdimTpB63Lfi51yky8p+IrA5KYN2RFg72iZ2TDfKX7nGYPYGveKK?=
 =?iso-8859-1?Q?F1LGDbe+HlMJuHzu/fFFGTOKHbX+mnMrWEnzQJ9o1ZstUGoEQTsZMosc0I?=
 =?iso-8859-1?Q?rpvCwtqpv/6pqEgmHVKfzhzfn8OPC6IywE/GTtS126idTQDG0FfFK4jZnU?=
 =?iso-8859-1?Q?oUCLQScS30Rs9QPJQJ4ggva+yT6wQUIn6k94q79SEd2FrYrNNK0g8UIVVe?=
 =?iso-8859-1?Q?0HtPvc7Bjj9L5TJick5WbjFzqFQKhxjLt8jas+z6QiI2XYuEjHwO+5/4z6?=
 =?iso-8859-1?Q?9Qt3wYNE5w5rvDcH/6Kz3NvqslAZ82lbcX46PdhJk9jdWc9nVZYG6NHhw6?=
 =?iso-8859-1?Q?58UeDf/Zy5rLbvqLQ9DVqyA/rRjRua5I7xDwuFp8ja/Es84Pjoc99y8zks?=
 =?iso-8859-1?Q?odUW1s6tt+1qlBlklrKKDY3jduMfQcKYBoWCOdqlaaDgezAgm+QqiVaBTD?=
 =?iso-8859-1?Q?6RwB0bMR23vggaSnrvaLlPmbIavm0K8fhTCJISeIm2cA/MI+6xJOBGTGHK?=
 =?iso-8859-1?Q?fr7tggdjMhONxG897RFiTV/o2GBdkn7z5zjKJJD6Ygwh+eJ3zsKhuAqtn6?=
 =?iso-8859-1?Q?x5TWpiE/jIqHV5YCfKQ5lapzgWEXGU7SddKJ+DjrpvEcCysc9ewQiL7kgV?=
 =?iso-8859-1?Q?z69k+Dgpp8Z5DnAdQ5CCWEgxUJUfTXBd1jFAZJo8MDk54415ePgQlMs7CP?=
 =?iso-8859-1?Q?5FNakKk/Z71KgUKwiUUumNFAG7vQqtA74DYKqwAwg+X8jAJcv0YYdA8qiW?=
 =?iso-8859-1?Q?POvDXEVUqCePJgFk1HVxSlVuiQl1yvyRBu1EAg36LiI6Rif0dpAK6GYVGk?=
 =?iso-8859-1?Q?GQa5j+0Dg65aP09rbo/1CRaxGLYhvs5HqCkk6kiLjQ2AtzSHnzU2WNnv8S?=
 =?iso-8859-1?Q?EzSIAFDcEenhrFDKp+tBQdpgjrxFJSSl6YUQrAr4PS/SkU91wTjcO0dWPc?=
 =?iso-8859-1?Q?e+rirkpF/jBJzNa9rAI/DHcFBnvMDlBDgeOHaqWqRqdUprPb0rCQF7nG9F?=
 =?iso-8859-1?Q?SGr3DwnPwk7KcY/kC43AhucYY5fRJ8zAtbCAglguHtanQlkPzJmpIHhHdI?=
 =?iso-8859-1?Q?Jg+sUr38P3Y8UL5XZZnjWJ8aTC6xz8F8ztYKWQOxebmXYd/6/bIgLNEN+6?=
 =?iso-8859-1?Q?wVoEjXuqcIfrSth9a/GAJspGCNZK4fXP0TmOAl/FHkFd34t/hRa0sY3Zt6?=
 =?iso-8859-1?Q?kPv6mai0bzXxCiTpPER0kj2o5WtTGsK7nX?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	Cf3PesDKhpJVPrgbPwd+zDi26wXpfw3jmnOGmcGKu5OJXxjAkpGR23/1OUyIVgdrzXO1DtaDo1S4bQeQ/7BsHDGelrd5c6vaL8xYzRyi3m8r+AOV5yGOcfTfdaOCkirtpdfQAqYXFT2WvpUwHtf32X644XLcKsbA13vx+eUjFZTRHAjTC8mnpjIhFguJMo/K5iG+sBK7CDMi/vX+s/cgvnvm7ZWlNUaL3yCNonv6gHD6by/mtI0Q7GAadi1sdhPFfCgy5ddRijuzug4wXfoAiL4hXA64zZVUGWfFXRFAEcBJu0oVL7jV7zeNd95NpiQXZ3xpXMS4rcZCiD+945mbuGO1jnlmrPY4C6WQ3aDTkfC9Tyl4klMh5utar922tMjRI6bwpexmGtcT2trEo5+d6ki4R0GCB9qW0TIQ5PxcfpxikSb3AaFIzH60Z8Tl1VwDHZllr8NNNQ2dyFNu1Hnavkx2o6PaGXdBcJ/dE5lL/JSsF6ayqMZOSlqR2yZl2wm6v3yD+N7IozyHtZTAl7bb782ypIC67WDTeCTQ+gTVQ0UJPpLW322PgziL+3bRCzZFLff3vftZ9Fua+CfDxxVG4RzeyRC0AwknRuTq7Dn1aa06oxexFTg1/8KuJ2/Ft8LB0jN6bGXo9FvB7+p2OxeiRwKSrNCvX3Hb6Bso5rjzv2CXN2rIPYUDl5/YvxnnmBbvC7Xil8Vf1eY6t//BWxn58ujdPOCaPCg1Q5UcLgsvp3Y9GlwNUrE9TuDLw0PujyFuPRMhv2lnJUbR6vEAitpGWrLBwVAhCvpTn0qlh4bHN0AIxXpwaMc48rTbHVGAxEHAImesDrnMOPpJgaAR0bzpu72zaPXNv4HS1+8TtXBqrN3Ujb7oY1ZAxNKL1pqRxKOC
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3137.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c85f69b-22f3-45fe-0749-08dafeec3da9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 15:53:02.6414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOsAUD05KQn3Df8Th6w2xAYRtO8SiymT20rc2LnmBBUdea+4mb8GY8zv+ZAzqDTOdkW5cLpGrMv9n0qSCMP6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8239
X-Proofpoint-GUID: ksIyKMd7VqhNrNqSEQjJLOt7syzBTuQd
X-Proofpoint-ORIG-GUID: ksIyKMd7VqhNrNqSEQjJLOt7syzBTuQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_10,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=705 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301250141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_075322_178601_D8ED9109 
X-CRM114-Status: GOOD (  14.45  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

> LGTM, although I can't really test it since the Synopsys qemu tree does not
> have qemu-user support [1].

Thank you for the review. I've checked this patch on QEMU with Linux system
and on the ARC HSDK board.
Also, I can say that it is possible to run ARC binaries on QEMU [1] in
user mode. Currently not all instructions are supported in ARC QEMU and it
is recommended to build binaries with extra -mcpu=archs compiler option,
to reduce instruction set. Maybe this [2] will be also useful.
It will be great to have this patch in coming 2.37.

[1]
https://github.com/foss-for-synopsys-dwc-arc-processors/qemu
[2]
https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/wiki/Glibc-test-suite-for-a-target-without-native-GNU-toolchain#glibc-test-suite-execution-with-qemu-user-mode-emulation

--
Pavel


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
