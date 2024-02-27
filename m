Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3BDC5478C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Feb 2024 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZiVqHQjWGoxlF71toiHbzblGqvRxVCaEMk6wrdl25iU=; b=nLfDXapIOFuX+6
	XPpibaBHH66tDDViZ7nnfG1gfByD2KawkSZbKb3s6pNHFXJVHJyB5aV6GghVXLPxEpdH1VyunAQzW
	mL9J8fLPBfwuPY1n91j4ejPPLXyjLt28zc+79tW5/TUBkc9srRXYy/15Z5SaFjBW3iBMq7/jkvZv4
	zZAJRQ/DlFoNdGLiffG3br91jiOLj1C3QX92ouM7IxFgnCvGPPvMMjyg36kYx6wIlxRexsm54O1Dl
	Kvzrm8ExPGSl9cfEsCGYY0Vwg1P6FXRjJIajZeH6kc+gd3xN8dCC3hUDrhNl5LsMLG5V87YCEhI2h
	jVb9CXLD2daoUHPWAl4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf41O-00000006kv5-39Nv;
	Tue, 27 Feb 2024 20:25:50 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf41K-00000006kt0-3klo;
	Tue, 27 Feb 2024 20:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709065546; x=1740601546;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=r1ifcatoiUsd+Xh1ttZqzMtffywVmMZdBueEkc6NyxY=;
  b=g+iZiBhU2pvXByIxsJFp/0Dpmp018V6J7yArN9wh/p3SIgk/baGea6Mr
   BXPQpLAi3rpQkk3Mpk04NpU5pbGiOwwcCOys71WJg6H6UhzB+TNbHDe7f
   wVx6JEhFv/G1EF76AhJzuheLuCmlcoopk4xIZ5lSr2CfJHVF1vxQRacTh
   VFZ6LjdwNujNvcjvad3DDyk9uvd9dU7VzCbiF4/DBj9QCPGvlmK5Yi0G8
   sEAe9w9awVUzLImbazEXashETsDopBQV+URSDNDL2MrfVRsj6J7DNDv4d
   K/W+ykhQ96PBkywpKirfzwsKmzLB7CPNbshi+UY2UR1WPiOtODnXLY/cV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25900224"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="25900224"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 12:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="11834764"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Feb 2024 12:25:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 12:25:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 12:25:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 12:25:42 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 12:25:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDUkeKD7a/FadVaGoSAfNwNG/XsUVoGG8zJkfEEzyxYgHDNMQCDpquST7bkOInhko1WyMBBjl2ZXBv9pg7htt+h11jR+Sbhva6YKVfj/mXYXtx/P2pXMUFKDJbDMRQBoyoFPKP+RXZhth/2MHwVx/b3Tdj9DkKDtrhWFQ5qt1Xh01YydRimqkWLD77A8U0O+SFXqoCrOhODebQ5NuEkXSAC2gl1VXtS0M2xP0XDrvCEjVwPCP6yk8Qm/4Jg4yM3fnA/rLCyEk/70FUh/PnUJ/Laq/hBfJ2o4XC0my1FBVokQgNfF8MnZaFH2IZLSj0VG/1c1qF18zxri01pQbVfdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1ifcatoiUsd+Xh1ttZqzMtffywVmMZdBueEkc6NyxY=;
 b=Az3uyDtD6hMps40M/GhuqMItCdIbZwgeQRxLvmjajj/KAxRRtvLgXX9sSPDO3RpblPvzUCSoGGhbT9ZaLVQpDcg2CkZwY2t+98O2WBzoVOMelVaCBX9OMFTatzvXt6KVbfVHC/8ZW8G65TGTtG5rQyLDkik9R7AxqCbJx6Yyk+gOws5MMvok8oGVzK0v2Tc7FT0QgRt2b7JzIEwnPHc20L6g4CO0XmDBc94X8HlJAKt+Ns7V4BsSUosxnlmHbKkU8iHrZ8PBopY3WsaLgvHS7zxO3xSHhKvd58PMQi+W2kK2BNglxNASowInEhiwlqnMREIA75du+S6FIrmY9E7KJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 20:25:39 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::fc9e:b72f:eeb5:6c7b%5]) with mapi id 15.20.7339.022; Tue, 27 Feb 2024
 20:25:38 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "keescook@chromium.org" <keescook@chromium.org>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>
CC: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "luto@kernel.org"
	<luto@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "linux-csky@vger.kernel.org"
	<linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "linux-snps-arc@lists.infradead.org"
	<linux-snps-arc@lists.infradead.org>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "bp@alien8.de" <bp@alien8.de>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Topic: [PATCH v2 5/9] mm: Initialize struct vm_unmapped_area_info
Thread-Index: AQHaaOdsOIuf9v8cz0SXVaOI9gIdJbEdxC+AgAC5pQCAAAKPgIAAJA2A
Date: Tue, 27 Feb 2024 20:25:38 +0000
Message-ID: <91384b505cb78b9d9b71ad58e037c1ed8dfb10d1.camel@intel.com>
References: <20240226190951.3240433-1-rick.p.edgecombe@intel.com>
	 <20240226190951.3240433-6-rick.p.edgecombe@intel.com>
	 <94a2b919-e03b-4ade-b13e-7774849dc02b@csgroup.eu>
	 <202402271004.7145FDB53F@keescook>
	 <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
In-Reply-To: <8265f804-4540-4858-adc3-a09c11a677eb@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: eb1ef6ea-d7c0-4fe5-8e10-08dc37d24329
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0NTGFaDF3AnskwLwCUCcJ8N0/zZKaZUncC0PBTMkOc1/+C8Cv5uHaBOu/0Q6tj6L6OnYUoZ0IhpkhITJFTl9N28pMoNiArVQKRjr0aNKPsegKnP6SodL+rm1GrHAofKWFb3NTYH3pRdQDcxZmRAzWD/OO9INDb0toBE+rOWwZg5BTl7GwTo2kbHVaw72vrSwI52Jw05h2SEswUm44BBQFE5p4Lla31bEXG2o/FpfLEORugA55MTt2HXfDcekXKYTZXXKvlDGraQzFDD5TE+ojj/J1x9kVffHjhjFsCZaFfSweA5kRSKvIaFVGc3KjGc2oKPuK3zDFBYwj9dtT1VTrkM4kEKdpywbitWmzMO1CgoRsX9IzTcrE1lF81Jo91eSY/kOdWqe/uwMCUo/MTmj1YTwyCxQuirL0Qm/qTYxzkj4ztrgyNslC+Ng48JKLBJR0HhCRo0GV7MwOTuDcvXic3RNhla+GHbZHDDiZikr8IqCRl45qmi6m5CHniLGaB7knp8+q8+mEWK0yK/Xguz/9IXc0tcON942bJyG7esXH2+DRyJpA5I45weyfLp0rcrIODH9D0z9TW8BDZxa2NazPz61jMAgM8xWAoIpbtvyjTBP++XlkIw5VDsBiFLPyeO2DYstnM+y7qlYhGRSQA7eAGXlZrRzcLFUDFcxPNjt2HMZ9elDc1dELnLY39p829qizFDVyDdynQJDY2JYYhBNNzklaQWiq+eRrsKTiNm1Rjc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3BpWXVyVTNIa1h2Y1RGZEJkQUdSMHVhZUd4OEF2S0xaTjBBMk1nRk1aVDUz?=
 =?utf-8?B?dmE1VkZMMXF0Um1CS3kyWEtoTHhCeGxDK2ZzOWw3bXdyU0dZdjJjbUdSNTR5?=
 =?utf-8?B?QnhySExJVWF5amF1TVM3YjNBdThMcVc3cXBibnVybjk0WVhLVWV3c29ZQmlo?=
 =?utf-8?B?aVNoVlUyazdDUURWVitCejl0NkdCZzExL3ZrWmdSMlhaU1d0cWw4Q3NyMk42?=
 =?utf-8?B?aDNKb2owUmdQZmpLTzV1YkgvYnBOdElERTFpUmQ4djdMOU01djdaNDJiaVJ4?=
 =?utf-8?B?akhOSTJoUzNzZGtuV3BNZE1JU1FTK0x0UVBYMzROSTR4NmZiZFVoUDRnOFRP?=
 =?utf-8?B?QmVjeG9DYzEvVmlzOXJTY2RMcUh4dlhHcWg0cGdvVUtzTk14R2N5djVhMm1P?=
 =?utf-8?B?NXZEcC81WlNzdisrV1BTY0dwbndyQXg4K3dtTWJsSU5SS0JKSkI3SHRhcnBy?=
 =?utf-8?B?L2cwNmhwNng5NXgxWnhSWXdXK3E5V1VmUmJaVjJHZDdwRGM1WE5TTHd6OC9H?=
 =?utf-8?B?bG8wMmxZZlIvYUwyR0VmOVdIWjFvMnczMmw2N0pEbjh0alpkT0JBMWs4aXJp?=
 =?utf-8?B?Y3BOVmphcmdBVEtsQ2NMZnZyQ3RUenVGRHM4YTdIU0ZlRSs5WFRnQWZ5RUMx?=
 =?utf-8?B?OWF3OTJyMHkxUEs5N0V1VFZOenFHYTJybzZpUlVzUWdPTFhHRlcyQTdJZlJQ?=
 =?utf-8?B?OHErMXpVd3c5ajNzOTdoaVBubWczck5Gd3BMci8zbkdFV0xvN0Z1TnNPMVBN?=
 =?utf-8?B?d0t3bEMxNHA4amFvYk1ENFJRcldjemhnMjNvSU1OUUtySjNrbHYyTllKdTl1?=
 =?utf-8?B?WUNJNHllQWhZQ0I3SnI5VXo1TWVZUTl5WnZ3dk9kOFlYeXZuSXRDN2NaMnFH?=
 =?utf-8?B?Qm1Ub2NUejl0ampLMXRySERieUV4YUVxNXNUT2oyZTdwVHFQUWFQazdyeDhy?=
 =?utf-8?B?dGExNG5ja3hFNE5CZXNKODMxUjFkWWhRd1YyRmVHbHlBNkVxNnl4ZUJ4NUhx?=
 =?utf-8?B?WnN2Snk1OHZFYWFOa3llZ3c1OEZ2L0Y2VVpuTlpGRFNIaWZRL3dWaUJPaEo3?=
 =?utf-8?B?QklqWmxBVTlHNEt5eThFTFM3QXA2aW54QTBVMm9qSVpwK1h1ekQ0Z1lSZ0dr?=
 =?utf-8?B?dWN0S1E4eTdNMUMvemlGYncvdHViTm0zOGd4cVl1dGdxR0hsek9qMzFiWjNE?=
 =?utf-8?B?RVRDaG53ZXdYTE5rQmZpWTc0aXI3OGg5UHZoTzhkZ0hubW91UDZlZHNFeDlK?=
 =?utf-8?B?bGp6QlN4YmNmSjlOMUZxY3Y4U28rajBLT2xNNWE5cTJEaE1qRVd4NjQzOVE3?=
 =?utf-8?B?QUk4M21wT0kvLy9sclpuaDRlWmdyaG1VcC9KWG8yNnU2R09Ed1d0U21FVDRO?=
 =?utf-8?B?bDQ2WDFzYzBSVnFCZEpoRnF4ZjJmck54R05HcVlpL1habW9uZWlDR0Fpak1H?=
 =?utf-8?B?dVpRTWZDUGJPK2Y5OFI2YjYrT0dFNDB3ZDZPdWV2RXUyM01VTmtBNHFWM3hs?=
 =?utf-8?B?R3R4eGo0MlhzTjBnejBPeTNPNXRpMzBnSjM5YjlMd1graXp1Q21iQUlKL0tB?=
 =?utf-8?B?a3RWRDJHZjRGaGhmdTBLNG1yYittOEZ2OForemNJR01WbFZKSWFFY0xFeks1?=
 =?utf-8?B?b2Z1UXhUVXJKb1ZFK3JwWXpjTktrY3BuNmtKaEg5NXBycDd0ZVZzR25vRDF0?=
 =?utf-8?B?WHUwMXNjaG8ySTNKdHd0d1NFQ1lhNmp6QzBLOFhhREJHVmNRMFJ2TnB1YzdF?=
 =?utf-8?B?STZuWUZzbFVNTytyRDh4anZFMG9hK2pNZ0VINUUxamdzV3FJTFozOXpHcUlE?=
 =?utf-8?B?WC9OTHpMNGVLcENGS2pUNUU2a2tqV0FSUjN6UjJrYTU2NDk3dTlhUUkyRWhv?=
 =?utf-8?B?dnBWbVlsUkpPZ0ZCZ0N5TU9HSldhNkl3ZW1udWxvMFBCRHlzYzBmVHVQbDBj?=
 =?utf-8?B?d3VZZS8reVVWRDJnUGJsTEJHV3ZKTFF3b0FXNzZ5K2M4SmNXSzdUWnZkQ0ZH?=
 =?utf-8?B?SmtIcCtMYit6cU5sUFB0VmdoeVRsNEJiVVdsVXhuZHNhZ1Rha0lIY3NpS1ZC?=
 =?utf-8?B?UWkzU3ZPK1h4YTdkdE94T1VWRTFnRVhqWVI4TlowR1dvVG5VTm9xUjl0Umxy?=
 =?utf-8?B?L3Y4UDh4S1I5YnY2OVNvYS9oaHVoeExqdDVrOCtaNWdMSG00SDZmRWFUZkZB?=
 =?utf-8?B?ZVE9PQ==?=
Content-ID: <64F24BEF83BF4C48A11FEA975D7F6246@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1ef6ea-d7c0-4fe5-8e10-08dc37d24329
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 20:25:38.9160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alyDoEOTBDOL/uZHfXWW+JI2if0b7ra4RHspdeUPmWcysp7Uwk7OnuVYMG6DZLlWIgoM1QzJvIhlhEfWfKQXg55gvR+u8ebmb52Ti2XnUlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_122546_986661_093F2FB1 
X-CRM114-Status: GOOD (  21.00  )
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

On Tue, 2024-02-27 at 18:16 +0000, Christophe Leroy wrote:
> > > Why doing a full init of the struct when all fields are re-
> > > written a few
> > > lines after ?
> > 
> > It's a nice change for robustness and makes future changes easier.
> > It's
> > not actually wasteful since the compiler will throw away all
> > redundant
> > stores.
> 
> Well, I tend to dislike default init at declaration because it often 
> hides missed real init. When a field is not initialized GCC should
> emit 
> a Warning, at least when built with W=2 which sets 
> -Wmissing-field-initializers ?

Sorry, I'm not following where you are going with this. There aren't
any struct vm_unmapped_area_info users that use initializers today, so
that warning won't apply in this case. Meanwhile, designated style
struct initialization (which would zero new members) is very common, as
well as not get anything checked by that warning. Anything with this
many members is probably going to use the designated style.

If we are optimizing to avoid bugs, the way this struct is used today
is not great. It is essentially being used as an argument passer.
Normally when a function signature changes, but a caller is missed, of
course the compiler will notice loudly. But not here. So I think
probably zero initializing it is safer than being setup to pass
garbage.

I'm trying to figure out what to do here. If I changed it so that just
powerpc set the new field manually, then the convention across the
kernel would be for everything to be default zero, and future other new
parameters could have a greater chance of turning into garbage on
powerpc. Since it could be easy to miss that powerpc was special. Would
you prefer it?

Or maybe I could try a new vm_unmapped_area() that takes the extra
argument separately? The old callers could call the old function and
not need any arch updates. It all seems strange though, because
automatic zero initializing struct members is so common in the kernel.
But it also wouldn't add the cleanup Kees was pointing out. Hmm.

Any preference? Or maybe am I missing your point and talking nonsense?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
