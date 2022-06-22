Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA874C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Jun 2022 14:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMW4sEsWZus/ojlEkG6Rjwdxl353ZT7vIIeIaVrj0O4=; b=ZGn5fXFQAl57Sa
	nek7jT20F6H3PkY9EBnsTXnUk5J9oKyoDlU6F4Yka81pY2+ptGRZRyd6v75FK/V4FmBmP6OTKaCGg
	3/qSfnAn84xl8Ff0EwnGAiInMgOQCP3kZidTZIQnhSBI2Jl6McUtQjGXIE0lQbwDCQcv0NVoNu4bd
	X1N+3VGAYrbNZtz6pyTEnNqll5Ln2dz2HZflsAxsg0Gn+81xD/NgFMpC/ybjcKg4TrggqoHvcz+U+
	KHZu+tLL+45r3XayG+b9qOWLDWvfZaBALbJ+fw/p5JmCfwg2+lc2triuPebjfHHS1JAcns9mADldL
	JsqmKXrUWlmw6baUflIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o414c-00Ap5b-BL; Wed, 22 Jun 2022 14:11:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o414V-00Ap1X-Nm
	for linux-snps-arc@lists.infradead.org; Wed, 22 Jun 2022 14:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655907068; x=1687443068;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0Jwx813Hx+R/MfUqXoZpHKs8xspl/H84jDdJ+Ugn2uU=;
  b=uiOpPYg8jJIOWg84bZuVqDu2rOuyaWUhYesnPIsbdUAkMNkksWWweNM6
   i13gtuqjlAwOrJ1mCXzA0nXYov5x2jZ8e0phL7L+taTl0hpkkeE/Du3Q5
   ZhUlhBFopM6ta6P1mk55Lh119oFySJSUSLpHo0LOjB3WBcVEg4dmZbvB6
   ul9IAYBBLmpLnuxW1u19xuDLbbGR5iWCynb0g/Gft1LrOq/rFel+G5CKl
   CpZlQ81JmP5ANnGaXD3P9OIEy1Kwk3nO0maxGuZ5fuSD80wRPpSnaOWNm
   eCJzCzE6oFNdAIZpIdf7mzwytpJbtMCfX4G8tHlmSL/p1akk9zMw+MTLf
   g==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="161549061"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jun 2022 07:11:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Jun 2022 07:11:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 22 Jun 2022 07:11:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DC098fu/eMowgvWXXUVzVWGNPz6e0m+7XLQ0O0JQSWOF6TAkNqaFuhOsHMwH5LFuYBSaQ5+IZDpZe3gqJzp6zIjqfaNRYo0GrGQPL2Yh6h0HD93QVUbr0wnw+At6DRthAuk62pu88iTHNc5WzFElg09b976o9In9zhOawPTfo/pRKCtguay0I/pWR8v72jrbtjDQ4mBIffadrG+dZqfu+frcF2Ehifq/SQsfeSiukra7kzkcSyPWt1TCQk2Du37opLLMFClrU5w4mRXBZdqcXe4wuS7YRHyAjnoHxIa47TgT0vLpJOT3pM/t9c1iYRZffpuD8wYg8N33ikgxx4QqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Jwx813Hx+R/MfUqXoZpHKs8xspl/H84jDdJ+Ugn2uU=;
 b=bxZETKBRBFSXGLLBaxLw6pHrHdTdoiGUlkYSg08qY1RK8vHHioVpYSWHcnO76rfBrBGg8hd5W/AjrzE6dr7nyOS1731C7G1p1kgszkKfudUUSHMJkjlf+n3MsLipab1jtREwsDbapFGfzdpzFLxayG9xE/MWpJbMZVDbZb4tMOe3XpFec3auRN90kMIgMYTLVdxXXRs4c7uTWyhkpEV7Y8zxOIQl91ZlWwPH7vU2fEt/FFDueVtsPaatcU96qbjqs9nDwgsssU3DVRFdtpb3tHdc1j70+GJMhdj2SExn5NjcwqMeBMszM/bt+UwMwthy2BEJOQLsBFmEq9zpOGeD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jwx813Hx+R/MfUqXoZpHKs8xspl/H84jDdJ+Ugn2uU=;
 b=lIDNELBoBt/aSnlg9HbqbNXHNTLDadauaSqerI/9XIg5yg9IKZTFZSlDEN/CLK+xvwEDyJPZu4MOYDbdEDvezllqQCnJq++xmPB+6kRekUqkS9LgubKIY4rs+T6ETU3FSvArRz0hln577x7qOKPBaEloxXu9VMGBbG4dpRPuSps=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2896.namprd11.prod.outlook.com (2603:10b6:805:d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Wed, 22 Jun
 2022 14:10:59 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 14:10:59 +0000
From: <Conor.Dooley@microchip.com>
To: <julia.lawall@inria.fr>, <bagasdotme@gmail.com>
CC: <Shahab.Vahedi@synopsys.com>, <yuanjilin@cdjrlc.com>, <vgupta@kernel.org>,
	<rdunlap@infradead.org>, <linux-snps-arc@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARC:mm:Fix syntax errors in comments
Thread-Topic: [PATCH] ARC:mm:Fix syntax errors in comments
Thread-Index: AQHYhkHl4AHekmb+EEOjU0ygvsMvDQ==
Date: Wed, 22 Jun 2022 14:10:59 +0000
Message-ID: <b92dad21-537c-c2c6-2f03-88b2ff6e268e@microchip.com>
References: <20220622080423.41570-1-yuanjilin@cdjrlc.com>
 <YrLTCXLrr3HB39lv@debian.me>
 <4cef89c9-3b27-11e8-2971-66b93b847ede@synopsys.com>
 <alpine.DEB.2.22.394.2206220513590.2646@hadrien>
 <46e4b588-d35b-ec50-ad1a-8502c2903677@synopsys.com>
 <alpine.DEB.2.22.394.2206220535300.2646@hadrien>
 <1b34e0e5-23aa-96cd-c37f-1434884ff061@gmail.com>
 <alpine.DEB.2.22.394.2206220943200.6198@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2206220943200.6198@hadrien>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce632aa8-eca0-453d-b605-08da54590872
x-ms-traffictypediagnostic: SN6PR11MB2896:EE_
x-microsoft-antispam-prvs: <SN6PR11MB2896C11E0C849059F63AF31B98B29@SN6PR11MB2896.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opq83VKyCwecB1G+v89zRMvaHZPN9jNrxf/4ETN3rC9VXuYO1+ZvubGNiSIs+kl1aLHKVKf2t+QHAM9K+goRa+xZLHsWV7MzOsUQ3+Gt2dhpMEaj8kL+A03uEJ/HrronJ4nRaoX/cxx+rrJtmR5+VCpOMst6ygH+elNI+x3NJApLWrUDR1aa0+LTE348KEPgge2pCFnEW1/0Ck/JiMwJulDiIVNzI05uztOI/S4lGTWhVQZRpeF2bk+AQtxCJY0S2VGb9xK3gvkFx7CUlL57jG+OcmzWt4g/rUWhq8V6pWVlesiYlYJEcBN/9XWxLz53HMK00TbGHJj9ot5CEKhbk8PUSnLbHT+8vcJq3UmJKh60DMz6VZqUziud2AXtccm4oChymSJJrYqzVRvkhl9hvPpT5qoa0ki6tBZ2iMqDGW/I+nHebaMhUNic26epveq0OXDpgsk9N+IU/6ZXOMlPcRD4wfKDR/120MhqFabZOCOIwNIEttFuvP/ACUuQwXrwHLZogVDj3sglsZrF9+mElAyN+oTdhn/F8tqFQ7V9tdWrGrrTOniLbGhzuTeRrWq1RAc4fBGakMR7kWHx7tvrAwnEH8hKQui2nnnHf48q5hUDZQtTHy4pTofC1HkgQlGwT88B1+L79mG827Rrto55oVH+pQ5aV+LbQcvPsCXsewpUFSNYdrmctvyfQe6LGXPwOWunwCvf7sSxdn+LzI/TPwiXwqOJ3FePItdUxPm07nUKXhrRlQMq9wNtTTPfS+FzIxZBqRCounwFM6ukRiw0lwuo12nb1qCTs4gumu94EWSon8nFL/fizSO5CkmefOy2sti2dn4pFeFp6ZxmgGtHyUytBMprACHHpA6mGLbVhwkya1HA6zYqTxxkL5dGxL1q6a6ieIFv4h5WnxOYBnU3rg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(396003)(346002)(39860400002)(71200400001)(6486002)(478600001)(38070700005)(31686004)(54906003)(26005)(6512007)(316002)(186003)(2616005)(38100700002)(110136005)(83380400001)(8936002)(6506007)(76116006)(86362001)(122000001)(31696002)(66556008)(5660300002)(66446008)(2906002)(91956017)(8676002)(64756008)(36756003)(53546011)(4326008)(41300700001)(66946007)(66476007)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aS85NXVpUnFBTHArZVdWNmF0andxZDhVZHp5eGc5d2p4Zzd0RXh5SCtReVVU?=
 =?utf-8?B?UDUrd3c0SUxibEdDcTJvTUt4NGdOVzFaLzR2TDdCcGkzVkhwb1VjVkEvTzZB?=
 =?utf-8?B?bDhmcTBaVE9FZVBqRTJXdHdDeDJZeVRQUjI5R29MT2Q3KzZ2VjVlQjVLTDZH?=
 =?utf-8?B?ZnlVb2RZdDFLQnhibHpLUVhZZlVtQzAzZnkwTWdaVHNDOHg0QWVvdzZCdGNZ?=
 =?utf-8?B?bDZZancrR3hxZEcrYlpjQW82ZDhYbkN0STVQek5YcDA3clhOSWQ3aVZiSy9p?=
 =?utf-8?B?dE5Rc052cGtKOW5Ec2FqQng1S3RBWkdCV3ZkWmppbTNOc3kwZTh5VG4yWWxR?=
 =?utf-8?B?NEd4SGNNQXBsNzA4UHZuNGpHbTZ2ZGhySTJpNlpteEZ6dENUdmh2TFg5bnFF?=
 =?utf-8?B?akxJWUhyRkphMkN2djlhMlhMSmIrd1FUWnAzaXRyeVRlVkhad25ZeUYrRGxL?=
 =?utf-8?B?b1NkTzNBZWMwVVJCT3IwbkVKaVRkUU9kTTcrQWxzNFp3dzJPYzYyOEVkZjli?=
 =?utf-8?B?aGE1RGUraHYycVRpUktwUHhGdy90bHhrOWIzRU5xaXFHUEdRUWl1bW9xYUFB?=
 =?utf-8?B?Vk9lTG53aVRaRzhqZkRkMmRNYzlydjVEYVRIUVMyMzFKY1Z2VE9MYzc3dEFF?=
 =?utf-8?B?YnFwWGFlM1VGZWFVeGg1d3B3eHUzSWh6MkdWcmwrSnFoSFZEVXNsSVRTNEVw?=
 =?utf-8?B?VDUvUzMvd3V4STByVThrSEMvalY2eXc2VnhrUjBQNExvTVBmbkQ0K25sTEtN?=
 =?utf-8?B?dkRZNW5GMHlrYTR4V0VYNWxBSU4wMk1KQ2cvbnIwa1l6RjJBSDI1VjN1N1ZU?=
 =?utf-8?B?V1VJbVl6QTNqRm9KOUp3YWtMUVdrdGxPekp6SHEzYmpCM0taYjhSK1VxcURk?=
 =?utf-8?B?b2tSNVAzM29TTGpuK3kxK243Tm1zVk84TktJWTJiQ09GTnBOL2JhbENtQWdy?=
 =?utf-8?B?WGZTSGdTSWViK1FYK3VQWjUweW83Rk1ZYmpWSytHTHRUNnU4MHQ0U1pQYURL?=
 =?utf-8?B?T1hDazkrOWF4MFFxTTJpUWNmeGdjc1dxTnlJQ25RQUFsc3pOUVEvaTdGZGhQ?=
 =?utf-8?B?S29aeldHK3pQWVh5UCtmSHh4R251N2srV2haL1RJM0pHQzNpMTIrS2JMQXZn?=
 =?utf-8?B?aEpVNEMrMFNBaTZyUnVKUStCcmxVRUl1bngwd2hvd3FnN1oyeDA1S1Qyc0hX?=
 =?utf-8?B?MGtFQlEyS0ptQmtWMUo1emVuWUR5WWVYa05KMHRhbE05bkI2bjNmSTBWSE01?=
 =?utf-8?B?eStUVk5oTVQxT3ZLcEkrcHF3Qkx3QWFTbDVrOVNpVXBBQUtqL0ZQVWFFZjFt?=
 =?utf-8?B?bmo4bDV1S1dRVmhFeSs0aTAyak1zbzlPSFlkY1pIV0hVVE5pM0JQWE1hVmNL?=
 =?utf-8?B?RHVIdzd3UEhKZ3JCWDlVb09uNmdlNWJQbksxajYvNDVBNUM0QjZVdklUYXor?=
 =?utf-8?B?eHVLVmJZTEIyVG0zSFNFRjBxbXFFNnpJTDFpNWlpaTJOL1JBdG8xa01memUw?=
 =?utf-8?B?Zi9UVE82Y2FEc05WZ2FLNFowUTVWdG50NHJPVDU1ZEYwOHVjaUYyMkFqZFc0?=
 =?utf-8?B?WjA2WkY0WnhxUHB2OXM3M2JYWEQ4VUVLbFRmbHM1VFBxUlFQamNUaEJrV0lX?=
 =?utf-8?B?MDVzK3ZRak9veDVaN2thV25FaEt0V211cXFpNUd0MnN2WnpnL1ZtRHJ2Yk0x?=
 =?utf-8?B?b3JMdEpyamRTdDczZ2EyZDVhUlQxbTczbXRJMzlYdWNiM3c3ekx0b2tmc3p5?=
 =?utf-8?B?cEFlOGgyRjgxUGZMdE1JQm1ZdmE1dHFJYStuY2lRVmE4a0U2a2VpV0xjMU1L?=
 =?utf-8?B?OUw4V3hmSFVyVjhMRWtraFREYkloc0lhcHhOcE1QNEJIVDczaVhYRURJYUFI?=
 =?utf-8?B?a0RJdmNZR1dJWUhBN3RkakpuZDhKZGd6UU16MnJiVHEwdlV5OFFWS2E4dHVz?=
 =?utf-8?B?dFF1RGl0eXRIM2RNeDIxcEFGb1BXWTFCbi82UmhuN3BBdnd2dFd2UUp5ZmNE?=
 =?utf-8?B?WmwrTDBCNzl4Rjg4ZzVBaEU3TWdBSyswcys3NGdDaVY0NWVaQWpWQStnWXlX?=
 =?utf-8?B?dVYwUUZsUGx6a2U3ZXkreFlJZVIyeTlxbzJreGp6ZTdwenVIaE5Fb244K0NX?=
 =?utf-8?Q?fa1VFBzt7/nCMWqm59TKQvblL?=
Content-ID: <9C0E2C65DB3C50419BDA7324949EBE06@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce632aa8-eca0-453d-b605-08da54590872
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 14:10:59.5810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agBwz9WK2ycydhBGbFMNj/lhT9X3nLvXM9z2sQXnuvKWlNY0bEZd9oPZn2hH0iDmcm4rx0mxXCCZ5lI/PKMTqtOZTcxjZjWCNcJpkf96l10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2896
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_071107_984960_8DB4AEFA 
X-CRM114-Status: GOOD (  22.32  )
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



On 22/06/2022 14:46, Julia Lawall wrote:
> 
> 
> On Wed, 22 Jun 2022, Bagas Sanjaya wrote:
> 
>> On 6/22/22 16:38, Julia Lawall wrote:
>>>>> So code that is fine will have typos forever?  Fixing typos in comments
>>>>> doesn't break git blame for the following code.  And typos in comments
>>>>> give a bad impression about the state of the code in general.
>>>>
>>>> Of course not! Documentation is as important as the code, if not even more.
>>>> However, fixing typos to increase your commit counts to a reputable project
>>>> is not fine either. For instance, many of these proposed fixes are targeting
>>>> one single typo at a time. Couldn't they just be sent altogether!?!
>>>
>>> I have the impression that the person is just trying to figure out the
>>> patch submission process.  For example, the subject lines are not
>>> formatter in the standard way (I sent the person a private email about
>>> that).  Perhaps just let him know about how you would rather have received
>>> the patches.
>>
>> In recent times I had seen many typofix patches sent to LKML. You can see most
>> of them by querying `s:"fix typo"` on lore.kernel.org. Some of these patches
>> have been merged, though.
>>
>> What I say as starter thread is "ideal" scenario as described in
>> Documentation/process/2.Process.rst; that is we prefer to see these minor
>> fixes as part of real patches work (say refactoring), rather than just being
>> trivial patches.
>>
>> But what most reviewers here missed is how these typos are found? I guess
>> these can be from codespell or some other tools, or even manual review,
>> then send the fixes en mass.
>>
>> Take a look at "fix typo in a comment" aka "delete redundant word" patches
>> at [1], [2], [3]. and [4].
>>
>> [1]: https://lore.kernel.org/lkml/20220618132659.17100-1-wangxiang@cdjrlc.com/
>> [2]: https://lore.kernel.org/lkml/20220618130349.11507-1-wangxiang@cdjrlc.com/
>> [3]: https://lore.kernel.org/lkml/20220616163830.11366-1-wangxiang@cdjrlc.com/
>> [4]: https://lore.kernel.org/lkml/20220606123419.29109-1-wangxiang@cdjrlc.com/
>>
>> IMHO, these patches should have been in a single, consolidated patch, since
>> these strip duplicate (hence redundant) word (single logical change).
> 
> They go to different maintainers, so perhaps each one would prefer to get
> their own patches?  There was a trivial tree, but it is apparently not
> very active.
> 
> It would indeed be good to indicate how the problems were found.  That
> could suggest whether the problem has been addressed comprehensively, or
> whether just some random issues have been detected.

It would be interesting to see what tool it is, because there appear to be
a bunch of false positives (although maybe that is on the user to read and
understand the tool's output)

Thanks,
Conor.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
