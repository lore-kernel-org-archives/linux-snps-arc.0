Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E10FC6377D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 15:35:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57B8F610D2
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 15:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57B8F610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yd5d5NYmKP4gN5jh+xzCmkQnaR+PR3dNIkWkhviin4Q=; b=f/9xiKRz/SoYoV
	1tgdxjESiiFKQu9MSBGaQkqTqHL8ZsFKwiagc0JyLzamWZZaknIXplcTkEuxSvAxhiYAQVHRi6XMr
	h6eTT4GeJ0EreRRCZONaj0vv3VsxCRA/81+Z1bZW/K2bGEiGHp+47WrOZgKxHi8vtTqMdtlPJFsUT
	2y995J/BMU8/+iZGJQzxz/btuUm98dLgCWxlEa4hxExO8fn8/QVzDVBxsgsRKuTOetMazLOg73XhO
	ITdsH/jVCoOO2YZ+xe+rgeaeQk+rQ2nSAg2HbEvNP/ktoDI/x2N4jiUjpxB5uo9kR+73wYTRlpc++
	7VcCeaQ7FfTNnYPbpJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6aix-001znP-Se; Thu, 22 Jul 2021 15:34:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6aiu-001zmN-WF; Thu, 22 Jul 2021 15:34:58 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9C5EFC0D1A;
 Thu, 22 Jul 2021 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626968094; bh=BUmPkDLja1uFLv96/XaBMTZsg8QTHky2W5R4FFmrI0A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=EIBBJjugEky3JsM7pf0+Ro1POZNEpA6I0endH1gjRIsXabif4tbTX13wdSJ+6QjD+
 +gupSERS45/x83PZeXCIlNP/0KCqeF3C8f5Co24jStQe0xLALliO3W6be1xwTewoDd
 ks4P/B+mKp5T5SH3wZhXNeJl+OYiCsfJOz+Dvz2WaJXslqAacXnQ/IiW796m56O6kZ
 m5veQ10zPJWEy3oFDpBDGX5vPsx/R9w3o8+pje/aA69xQrNEs2qramTLnXCSnwgZgd
 nLDbEfKsgC3w50wkvQdlu+HzOEs7vyYNEQNhnKweCLi1H6bQciUUuKw+tRk0Ouh+5e
 umoBaTUMc7W5A==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 60522A0071;
 Thu, 22 Jul 2021 15:34:41 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EEC3E8145C;
 Thu, 22 Jul 2021 15:34:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="aiooDNAn";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gvs7Igd15MDCOZ3H2UErwkI7rrwKjGclHqmf/Aj5ToYKPLF4TX1Q2a1fgHZsixzGYU6+2oN11C2D5jgnuuFHZ7E4jKEJkeeDwxis0u1LoR0XlugOviZ59dkMENO1B7q6eITDomzgZowcU734Fos3DPiZbJni0JYa3xj/V3cJZVWA3ji64+SD8bB/mCwFFYy7y7e912UbsDKeDI6IGD3W+4uBqA2XBSRAG91W57PPJDz4DychN9jCWSAGhfC6vhG/ewiIt8yTVssGKfQP2La5M1H//yY4L/s6k744IVB5SEHL0qsF3uFQ6SUJVuKhA68LqWz1X3kgSlNWQZiV/7PyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUmPkDLja1uFLv96/XaBMTZsg8QTHky2W5R4FFmrI0A=;
 b=KYr+WbDIrMqOjBtbHDrnV395/meOSgByulfyVeIYS/FExybBYe6eisO8R3TnNASghvHanre4zL4pgZA4CRNwxOcLAzV78NXpj6abD40WA/t8OA0ugMRB6rG8GgUKFjCdYbMbtWH+rJ8SdiHV2zt7qP97FSk9ACxf+ly/896SjnNW7VKHqPBocmGKl5E5S5iHcANkwIzgNns/68sXcRS9aBZde9wLWCrgNe6k9zPXMS3dmMcYlhQFNmr5IdT2AqISFzSAyWz2n4fpIR0YSUhQ3GVSdzx293nEre0yJSCbKlpnplhkUoqC4y1rxVYQOwciRsZf9cQkr3wocW0fprxTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUmPkDLja1uFLv96/XaBMTZsg8QTHky2W5R4FFmrI0A=;
 b=aiooDNAn7Gf4KLOsE97sIs0YcAwQ7fBI+30gcSsyK19oOGc2BSVQJ9fm675PQ6uSfeztqJ/oRDTgxvKb7qt3BXp99KPIGpuhV/ryEIRkgGqwMmjyOKKdndt4iDsOxARKDQAnUxoRFMMtsNyT1+n7bxof6wD1lI0O8wklP+j0Qe0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4051.namprd12.prod.outlook.com (2603:10b6:a03:20c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 22 Jul
 2021 15:34:31 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 15:34:31 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Brian Cain
 <bcain@codeaurora.org>, Chris Zankel <chris@zankel.net>, Christian
 Borntraeger <borntraeger@de.ibm.com>, Christoph Hellwig <hch@lst.de>, Guo Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller
 <deller@gmx.de>, Jeff Dike <jdike@addtoit.com>, Linus Walleij
 <linus.walleij@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek
 <monstr@monstr.eu>, Richard Weinberger <richard@nod.at>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Vasily Gorbik <gor@linux.ibm.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, "linux-hexagon@vger.kernel.org"
 <linux-hexagon@vger.kernel.org>, "linux-ia64@vger.kernel.org"
 <linux-ia64@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-parisc@vger.kernel.org"
 <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, "linux-um@lists.infradead.org"
 <linux-um@lists.infradead.org>, "linux-xtensa@linux-xtensa.org"
 <linux-xtensa@linux-xtensa.org>, "uclinux-h8-devel@lists.sourceforge.jp"
 <uclinux-h8-devel@lists.sourceforge.jp>
Subject: Re: [PATCH v3 4/9] arc: use generic strncpy/strnlen from_user
Thread-Topic: [PATCH v3 4/9] arc: use generic strncpy/strnlen from_user
Thread-Index: AQHXfvf8c+XCb73zs0+6DIklrzt0SqtPIDGA
Date: Thu, 22 Jul 2021 15:34:31 +0000
Message-ID: <fe655b87-8fbc-101e-7b53-9f2a2887f7df@synopsys.com>
References: <20210722124814.778059-1-arnd@kernel.org>
 <20210722124814.778059-5-arnd@kernel.org>
In-Reply-To: <20210722124814.778059-5-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec03b6d6-36b6-418f-a43e-08d94d263399
x-ms-traffictypediagnostic: BY5PR12MB4051:
x-microsoft-antispam-prvs: <BY5PR12MB40515E5AB0629753B94FCE4EB6E49@BY5PR12MB4051.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7Ze4QZoZrS/OGnzY/ThZU1iOBTj4Wxus30kAe++63CnGmoI6DafaY5PRSnuOg+F93BUUSKBJzjB2js3ekTBommfasCh/F4EDJY4mfyzE8UGWkXvTHhbTh2otH7K4Tqdl6et+HBu5lXGZ4fVHxeKtmObZnpegKCk1UWV5SSzWcgb6oS9mheqkYwp1Ap3hiNZcHHcF9TpzUeN+5PFjspFrOLxRptD/EfWJG6xrN+1b1jTDoaE7QiExNCDgWRaXNYCEduexciDMMpsvHZbdd60r9Hr8Q9vqHaZuGpAEIfFTlBas82Fyx1dB1WUBg9ARsXK4wHBe9DRALZ0fBrIQ4tCr7Zkzmidb6e914zGDpCMNO2yZ+Prjtqew6Q/Othl2o1f3SJJGNm+ATX47BffPULvYsjJUQWOeUJI/9YmYAq170Hmgn3gJMaWcQlTp0ZC9vhV55PZBuLm7/GMwru+z0+rfxRIQ9hezI4MPIgGxZe61fjjBnXv7FUJfBUwFVo/t1/LSOcrLzauJjTpIDO0pZ8GganXwduiKVDLr7qo+sGQCAbvJTbVWKwTdHQAxWsJmvmAltieVW8r1DUFSJXRuweuYlFMq0B+pDTBTHsLVYmmhW7lo2M2W4xGgrDOKajPujpmFfr06LMyBIBViG8Yat3dK0hob4Z3wUSl1Jz4j184CYccXrqUxwdD8N4eVfuYxtB+eHsE3dSZCY6mDYLP+KUU3apxtHPs5cu69Efzlak6TbgGy3GoPIyN+CzgmQHQ+zUwZbM/VMl4QMIQO9sH9EHrkLTN9ZycTT1lwDReYfq+hjBo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(136003)(396003)(346002)(6512007)(2616005)(71200400001)(8676002)(7416002)(478600001)(8936002)(4326008)(110136005)(7406005)(316002)(54906003)(6486002)(2906002)(53546011)(5660300002)(83380400001)(186003)(31686004)(38100700002)(66476007)(66446008)(64756008)(31696002)(66556008)(6506007)(86362001)(26005)(36756003)(66946007)(122000001)(76116006)(41533002)(45980500001)(43740500002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWVDeE1LU0pLRHpjb2dQKzBiaTNPcVg3bldUUmdpTXZhT1grWURhaml4QXJv?=
 =?utf-8?B?K0N6d2NLRFNQYkVXaHo5OTBnWHQwT1Q5R2V1aUFzeFQ2MmhzVHlXT0dNZ3Q1?=
 =?utf-8?B?TkVWa082V2xDMHlxUDB6Mkd6dGhnTVN3bVYzZDd2Y3JjS0ZHek9vREhwcThy?=
 =?utf-8?B?WjQ5cG85d2h0Zk45NzNxWERLTFJYTEpnTWlWZXdiNnFNSkJRR1Bub1RLSHdw?=
 =?utf-8?B?YXlrcVQ1UG1LODdBaUkxMUZ1aHVkNXpING8xekZhWEFpMWlTaHl6alE0enFp?=
 =?utf-8?B?T0Y3R3h5L0ZSektSSmpKWlJjQVZ0U1Y1VENHRkFucWljVXpIN01aK1FpVWxB?=
 =?utf-8?B?c2NWK3pNWnRPMWo2UitKT2dtS1MvYmMzeVdwYWZ5c0gxTThzaVhPbVZHQzhw?=
 =?utf-8?B?aTFTdVJUcjJNaXU3QlpBektZcjlEOFdLWmo0VHJIMDN5MVAxSllMcUc3NDlR?=
 =?utf-8?B?TEhwcUhuT2s2SW5ySW5lMEM3UUt0WEtPQjdBTGhEUzN4UEJpWWFQQzZHeDcr?=
 =?utf-8?B?ZWdCU2ZtR1B4ZC8zOTJ5QkR4TFZoMExCaUJDRGZwMS8rTW94anlSOHFCN2dl?=
 =?utf-8?B?WjNtVUlOVmNEaHVvbU5uNnU4L1o4a09XOG8zYjVLdElwSFVPQzhGMDMxMVRW?=
 =?utf-8?B?aVNEQ2hYSkZuaHI5RUg1bW1oT21HNnBmek51ZTNRQXg1eURCb2Z0R0lwZ1R0?=
 =?utf-8?B?dG40dHdmMFQycTVNcVJ1U2lCL1NpSU54cUNEY284OXNBN1BDZUtTWGN0YytR?=
 =?utf-8?B?NWdNUHBNZmR6dkpHUnRDL21XQ2VvUnNuQTVYNjhDTDhXTk1GWGp5ZzNVWUlY?=
 =?utf-8?B?aHZGMWFGNzAzTnlDWUFWaTF1aE5obWdJdkVpbDZ5d1grYmFnZGpRSWZvY1hC?=
 =?utf-8?B?YWg2am9yNm40VmJBcExITEN4bng0bFZTSXB4Tm5FdDZrK2s0L04vY01tLzJ6?=
 =?utf-8?B?cUxjdTJ4bi8ySkMyY0JHdkZLQXZiWkhBZXFWUk1tU2RkbStrTEQwc21saWsy?=
 =?utf-8?B?L3pCSjdjQTg2anQ5VGFlK0F3MGRDc0JidFlxVEpjcUU2SlluTWUzWG5XRHlD?=
 =?utf-8?B?ZWFYS2RTS2FENGx4dkRObktHSmNqL2dNbklMY0ZaREZKNXh5ekRVa1l2ZWpS?=
 =?utf-8?B?NnB1VWdaODFkNUpKRDIxUldZdHVWaWwzNU1iZEZFTFdTNWRVN0o4cms0ZjM4?=
 =?utf-8?B?ZDgwbEg1eko5S2FENDRMSzZkVEtzVmljdU9hSlBjNlhOV3lZWFJPZDk0YXhD?=
 =?utf-8?B?Yk9ybDU2alhwczVURXdPNStBYkxhRklKeVpDRU9DclRmS01OZ1NMZStCaVVm?=
 =?utf-8?B?cnlxOUx0VE8wUmNqbSt4OERhVFpUSXVpTFhpbVVtL3lZZ1J3NXY5OGNnSTRx?=
 =?utf-8?B?N01WcDFRalBnNnZuVHBhMDlnTStOTW44c21sbk1wdWp4WStaOEZXZXl5Uzd3?=
 =?utf-8?B?VGs1cjFjVzJxc2tHdmRLV0VTN0Z0S0wrc0JRSFVOSTJ3Si9zaG5nRk9Qb1Ft?=
 =?utf-8?B?OWMrM0Q1dG4xSnk1cVRxZEpWU2pJd3ZGWUZpay9hVlJoNnM2WkJ1elBkQ1FC?=
 =?utf-8?B?VnUvc2Z2S3JvSHByUHNaOXhNNk1rc0tjZkxVRHYrSVlSSHdBZTd3Y3ZXdFBQ?=
 =?utf-8?B?MFZ1MGM3VmpGZVVtTE5oK3ZoTGJOa3A0L2JxYkVFSDk2QjZLMnRTa0ZoZEsz?=
 =?utf-8?B?ZkxRUnk2WkI1b1ZFb01VbXFOTDErWTJ0d3Q2ZDJKamVoMWM5L2s5NXZvUkFu?=
 =?utf-8?Q?2fHhAKVPSWZZWvACs0=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <73F9861E435C6E489C89616888EB6F96@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec03b6d6-36b6-418f-a43e-08d94d263399
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2021 15:34:31.7829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOC0QwW4JOMjzcPFA2Q5I4qw3NXUoEet0AYLJGf9kjCxGZYBT+GgNCH3P1sgynooHp67EE7OKcLm8F/OJ0lEBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_083457_226752_E9E2E046 
X-CRM114-Status: GOOD (  22.80  )
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

On 7/22/21 5:48 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Remove the arc implemenation of strncpy/strnlen and instead use the
> generic versions.  The arc version is fairly slow because it always does
> byte accesses even for aligned data, and its checks for user_addr_max()
> differ from the generic code.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

LGTM. Thx for doing this Arnd !

Acked-by: Vineet Gupta <vgupta@synopsys.com>

-Vineet

> ---
>   arch/arc/Kconfig               |  2 +
>   arch/arc/include/asm/uaccess.h | 83 ++--------------------------------
>   arch/arc/mm/extable.c          | 12 -----
>   3 files changed, 7 insertions(+), 90 deletions(-)
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index d8f51eb8963b..64e5f9366401 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -27,6 +27,8 @@ config ARC
>   	select GENERIC_PENDING_IRQ if SMP
>   	select GENERIC_SCHED_CLOCK
>   	select GENERIC_SMP_IDLE_THREAD
> +	select GENERIC_STRNCPY_FROM_USER
> +	select GENERIC_STRNLEN_USER
>   	select HAVE_ARCH_KGDB
>   	select HAVE_ARCH_TRACEHOOK
>   	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARC_MMU_V4
> diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
> index 3476348f361e..754a23f26736 100644
> --- a/arch/arc/include/asm/uaccess.h
> +++ b/arch/arc/include/asm/uaccess.h
> @@ -655,96 +655,23 @@ static inline unsigned long __arc_clear_user(void __user *to, unsigned long n)
>   	return res;
>   }
>   
> -static inline long
> -__arc_strncpy_from_user(char *dst, const char __user *src, long count)
> -{
> -	long res = 0;
> -	char val;
> -
> -	if (!access_ok(src, 1))
> -		return -EFAULT;
> -
> -	if (count == 0)
> -		return 0;
> -
> -	__asm__ __volatile__(
> -	"	mov	lp_count, %5		\n"
> -	"	lp	3f			\n"
> -	"1:	ldb.ab  %3, [%2, 1]		\n"
> -	"	breq.d	%3, 0, 3f               \n"
> -	"	stb.ab  %3, [%1, 1]		\n"
> -	"	add	%0, %0, 1	# Num of NON NULL bytes copied	\n"
> -	"3:								\n"
> -	"	.section .fixup, \"ax\"		\n"
> -	"	.align 4			\n"
> -	"4:	mov %0, %4		# sets @res as -EFAULT	\n"
> -	"	j   3b				\n"
> -	"	.previous			\n"
> -	"	.section __ex_table, \"a\"	\n"
> -	"	.align 4			\n"
> -	"	.word   1b, 4b			\n"
> -	"	.previous			\n"
> -	: "+r"(res), "+r"(dst), "+r"(src), "=r"(val)
> -	: "g"(-EFAULT), "r"(count)
> -	: "lp_count", "memory");
> -
> -	return res;
> -}
> -
> -static inline long __arc_strnlen_user(const char __user *s, long n)
> -{
> -	long res, tmp1, cnt;
> -	char val;
> -
> -	if (!access_ok(s, 1))
> -		return 0;
> -
> -	__asm__ __volatile__(
> -	"	mov %2, %1			\n"
> -	"1:	ldb.ab  %3, [%0, 1]		\n"
> -	"	breq.d  %3, 0, 2f		\n"
> -	"	sub.f   %2, %2, 1		\n"
> -	"	bnz 1b				\n"
> -	"	sub %2, %2, 1			\n"
> -	"2:	sub %0, %1, %2			\n"
> -	"3:	;nop				\n"
> -	"	.section .fixup, \"ax\"		\n"
> -	"	.align 4			\n"
> -	"4:	mov %0, 0			\n"
> -	"	j   3b				\n"
> -	"	.previous			\n"
> -	"	.section __ex_table, \"a\"	\n"
> -	"	.align 4			\n"
> -	"	.word 1b, 4b			\n"
> -	"	.previous			\n"
> -	: "=r"(res), "=r"(tmp1), "=r"(cnt), "=r"(val)
> -	: "0"(s), "1"(n)
> -	: "memory");
> -
> -	return res;
> -}
> -
>   #ifndef CONFIG_CC_OPTIMIZE_FOR_SIZE
>   
>   #define INLINE_COPY_TO_USER
>   #define INLINE_COPY_FROM_USER
>   
>   #define __clear_user(d, n)		__arc_clear_user(d, n)
> -#define strncpy_from_user(d, s, n)	__arc_strncpy_from_user(d, s, n)
> -#define strnlen_user(s, n)		__arc_strnlen_user(s, n)
>   #else
>   extern unsigned long arc_clear_user_noinline(void __user *to,
>   		unsigned long n);
> -extern long arc_strncpy_from_user_noinline (char *dst, const char __user *src,
> -		long count);
> -extern long arc_strnlen_user_noinline(const char __user *src, long n);
> -
>   #define __clear_user(d, n)		arc_clear_user_noinline(d, n)
> -#define strncpy_from_user(d, s, n)	arc_strncpy_from_user_noinline(d, s, n)
> -#define strnlen_user(s, n)		arc_strnlen_user_noinline(s, n)
> -
>   #endif
>   
> +extern long strncpy_from_user(char *dst, const char __user *src, long count);
> +#define strncpy_from_user(d, s, n)	strncpy_from_user(d, s, n)
> +extern long strnlen_user(const char __user *src, long n);
> +#define strnlen_user(s, n)		strnlen_user(s, n)
> +
>   #include <asm/segment.h>
>   #include <asm-generic/uaccess.h>
>   
> diff --git a/arch/arc/mm/extable.c b/arch/arc/mm/extable.c
> index b06b09ddf924..4e14c4244ea2 100644
> --- a/arch/arc/mm/extable.c
> +++ b/arch/arc/mm/extable.c
> @@ -32,16 +32,4 @@ unsigned long arc_clear_user_noinline(void __user *to,
>   }
>   EXPORT_SYMBOL(arc_clear_user_noinline);
>   
> -long arc_strncpy_from_user_noinline(char *dst, const char __user *src,
> -		long count)
> -{
> -	return __arc_strncpy_from_user(dst, src, count);
> -}
> -EXPORT_SYMBOL(arc_strncpy_from_user_noinline);
> -
> -long arc_strnlen_user_noinline(const char __user *src, long n)
> -{
> -	return __arc_strnlen_user(src, n);
> -}
> -EXPORT_SYMBOL(arc_strnlen_user_noinline);
>   #endif

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
