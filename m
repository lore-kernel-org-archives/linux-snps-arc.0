Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F45DECAAA1
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Sep 2022 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lk4PRcne7GzvKrMKSHC9k6SG2PbyulpCuy8/tMWwEBs=; b=fYM1u6IRfl79qT
	2EtTziTYHjfgohD5aAj58y3zKt11jZKMP6CJAfKgk/iGWbaUibxjvLxKNpYGGqrgasfcz1TSDMtkE
	z1pgzCa2su6N+47FcdmA/wvksbSIAKk/DMxoKJJNvt2MhrZZN1fBBsXCM+0E1dqpUZ+2/8JkMkv4Y
	rb633e4YxEHYiW2jUJLAuhABG7m+NmsOp8Yd0xX5GhT6yXjySVAJD09P7zpovzZ33/qOVEkWB2ns5
	50H9gTCk866J0lurXGv4yeeMmSfWH+tibg03+App6pgJwPl0MpAcriw623hCCKSt5WGjHnzGfwE/z
	tYh91AZ7bd6ZCMwS7Pgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVcUd-00G0Te-2c; Tue, 06 Sep 2022 17:36:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVcTt-00Fzqw-RL; Tue, 06 Sep 2022 17:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662485726; x=1694021726;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QR8gvZBpyv5eCF49zr2XkbTnFfFS99UEe8Eo81gM2mI=;
  b=UkCFNJDef7CEqLr7Omruh0rQpLHRM8BKlkp1sQybrqKLUC+/DKpBCDr6
   FjLbZTOgcqu4qcS2z0VE6aGqUUTRP755Mg8aS44dwhRS0NbfDce8FTl0m
   U1ELWd0sDErr0LadrjTXBVnPeVZ45AXTMK/gWF4oT7pVo0oP8ugltD6GH
   WbbsyZHEy6enyAtU1pMfkzKi+hDKzpPBoIh6uzMcMi8DzJ3oGfv1L8Ryw
   7Wzu3a5kmPS0KNluMAurl78RYuMMRprrwqPI+CqxIE//59eUjJKK01bgV
   17WCAlfJ1U5PMeEmIQz3VlzNRNnsTkKm/6PJYulK2N5oZUL7ro9xeSrKT
   g==;
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="179260968"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 10:35:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 10:35:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 6 Sep 2022 10:35:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AebR7Mtwii6SDzuUkKSRJyxYir8g1fbZmXY2wQpYH+dE2B2RKEjys+ry3Qof05yirRVPKbOQIylF6IyALDcdNi52WiKVMRSNvJK13JfOB/ZxiWeXVCjHjq5hTLCjjgLFgbdI85uyeR4r2FN257V2whaYONURkeDNK9SQ4f6pWGiBrHrFWDwIbpr6GAI0pmY4T82QdrHqFKzdA88sdDmjucCisAY8sImuHek0heEPWvQDS6AWNYu4f2oGhUtrX3nh10y/x5LwkXzbf69B+65e8jKw++A1zgGThsZnXCoDtL/xpLiAVhPtPSijftZqvg1YWucS+cVcmwvSR7IidFhyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QR8gvZBpyv5eCF49zr2XkbTnFfFS99UEe8Eo81gM2mI=;
 b=P/fXNnb67mXddIKmD4khDKSSTNN/34LXHFzrj5EBxE2Nkn+5gdD46WIkl0VefBvxmlOA//Mc+5TGmdozfr068/q5NLulfsIGzviV/OEybhCgvhPgf9tofjyfv60LV1xTF4F7eDw6TJVo+zETEYQxoo5XuWocFRrbHhz4/6AcNo172y0/O1ZyrcK6BxrTyjGy8j2TCKR1L9GPW9tix/VQOIw+8V4hYaX6Uqwee73hMuxMzABY8pI6iovdUC62XVHoLlQOn6nsoRuksXJaXyKAeRFQ5aby16ulNDf0+A+ZjcGUWgcjc7XHNnhYxjE1DoNsb10FOPe3dErVnb+RCNEbfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QR8gvZBpyv5eCF49zr2XkbTnFfFS99UEe8Eo81gM2mI=;
 b=Nbv2w8ABmAvdrHMdRI+B4zd50NMRbwZrLTbfy8ld3ba3Kz4sNcWmxb5iZJWPeHxjvCnabAcjq5aDFbsEjH2dl+aVq/dm0kI7dDOX1QFOONqEBMEXxXyvhevd96+H/EGVVoakd1Cwe2PE32f/pLYyNC30Pydk7PuIdbwf6PzIkec=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR1101MB2088.namprd11.prod.outlook.com (2603:10b6:910:17::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 17:35:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 17:35:11 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <oleg@redhat.com>, <vgupta@kernel.org>,
	<linux@armlinux.org.uk>, <monstr@monstr.eu>, <dinguyen@kernel.org>,
	<palmer@dabbelt.com>, <davem@davemloft.net>, <arnd@arndb.de>,
	<shorne@gmail.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<ardb@kernel.org>, <heiko@sntech.de>, <daolu@rivosinc.com>
CC: <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-snps-arc@lists.infradead.org>, <sparclinux@vger.kernel.org>,
	<openrisc@lists.librecores.org>, <xianting.tian@linux.alibaba.com>,
	<linux-efi@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: Add STACKLEAK erasing the kernel stack at the end
 of syscalls
Thread-Topic: [PATCH] RISC-V: Add STACKLEAK erasing the kernel stack at the
 end of syscalls
Thread-Index: AQHYuuW9rugSRYh05UmTe1hHac9Fz63SuDoA
Date: Tue, 6 Sep 2022 17:35:10 +0000
Message-ID: <6c48657c-04df-132d-6167-49ed293dea44@microchip.com>
References: <20220903162328.1952477-1-guoren@kernel.org>
 <20220828135407.3897717-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220828135407.3897717-1-xianting.tian@linux.alibaba.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c76c48a0-5560-42cf-0b22-08da902e2633
x-ms-traffictypediagnostic: CY4PR1101MB2088:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PUEJXo+oFmqdtN2i7ThrqMpY2fphg4+cgcjZtJZDK9ttEX2yRJtyGX/aUPOpr3JVRd7SCWBkNue6WxL+AHAis27FFzoBLYwnaaFlbWJFpgjRE8Www9QTNTILXiTAqh3RDQqN08JS7BG0t5Y5qLZsjxQhhSkesNdHftyQlAAMHUnG9ChzMlozunl7T40LwukJ5UBWtiHOhiXKaoDKfcKhNXFkPXNPwb3qHymydDn90pnPeGb/4+2bgAlhtV3ofX8MayN3/3TWczLVW3Olc3BQ4TFkhrzjzxa/eONedQzQ00ZVWXWghmvrtT/VqmPkaluV6UV/EOjpCa003OWqe7hbJ6HQEfY2Bk2ihcMv9lbtu64cSpoSQQiRzZfxZf5DWhvrvBOFZiA8MXRpZHYtxM/D11cy6tzGX6IsyBjfNiziDRCzqbuuYMiVmAd53osWlqCjaihIpRywXuluOFaVr3cBkr5A+kwLygILUZ5xWxiiCdsQUhGOHSmQdeHSup5tcS9YuGs6Nie2kZgUU99EVwC/zxhjgvoLDWY+keq+RnoMbsJlxhnNQSOkbjjrT+3kFKhtXdp+9XT/yW3uc2K+0MGurjtviQ9LzpXdrUG5yntOTWp6etIzmFzJFbicNyrsagMgQqggLUjCsZW32WVuXrPeXlIqYpLS1HsEDJkGkzG9NXI4KJcNBLfFnVHUsuIx7CbrvpK46kqmvRT+G3KAafQREaPhXQ+9K43K/akyJlDB6D1OOFS0Z0mZGR7aWz4pC2Z5gx3Kr3dG4kDT5dI2PPEijq7VoalMTAxKmJTbT5Ww4rveY9J1UXbkIB51opv36MbuYDCEMEzW0PmLM6ngqXogqn1YVMBkKaiOVze3Ao8femCYEPk/SLZdEKtJj/ad7EYBL6In3Cdy30FqSKJBCQ7h6Co2mtpjeul0IzDZlURngKY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(396003)(346002)(39860400002)(8936002)(66476007)(76116006)(8676002)(91956017)(478600001)(71200400001)(6486002)(966005)(64756008)(54906003)(66556008)(66946007)(4326008)(316002)(110136005)(66446008)(38100700002)(2906002)(122000001)(7416002)(5660300002)(31696002)(31686004)(38070700005)(36756003)(83380400001)(921005)(6512007)(41300700001)(2616005)(186003)(26005)(53546011)(6506007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SE43ZFZieVlzTTFrNVJGRnNPakRVRHd4R2J6dVJWck9XNzd3b3hxclZINHJZ?=
 =?utf-8?B?anE4VWRlbG5WdEFKQmtMOWZ2MUxzTTJuZ2tZMTg5U2dSS1hndmE3UnJoNEx0?=
 =?utf-8?B?K05TZmM0YVNsQ3pKbU8zYkpjYWJ6d2RySlZIdjhYMVNYZmc4c1NCc2svMzU2?=
 =?utf-8?B?QzZBTkRnQjcvS3U3NWUzb0JHMVRaSHVTZGxjaDZFWWFZdDVRekZ1RWxHbEo5?=
 =?utf-8?B?ZHBYZ0haZVdFQTdlY0UrUmZ4UnFEcXFXc0hubVFKN1NYYkNZOTd1bXY0dnl4?=
 =?utf-8?B?T0tJZjBqOW03S2VOOUw2aG1qTU9xSS9pZE5pMU1YTDcrMXFHUXRqS0FLMVVa?=
 =?utf-8?B?enpJTS9xMjRqTkxPWkJXdVcydzVkT1NBbFZZQmkydTFQNGFSRXBzMmNJekZS?=
 =?utf-8?B?QWUrZkhwaDI2MDZnYTdhZEZORERsWVpja2pQbWZHYnFBQlhrcGIvTU05K1N6?=
 =?utf-8?B?TXNrZDQ4VmFjMy96dWdDOUxIQzBGeERJd2lpNjh5WUNwNGNvUUNhdUl4TnVz?=
 =?utf-8?B?aXNaREdEb3NWQW5nd2ZQVEp6RDhnb2c2ZTllTmVSUnh2K1pHa0UyMzdzNDJl?=
 =?utf-8?B?SzduMzR6a3NUUGs3UWhYTGFnRmxrL1dsZzljQm5lcGlsN29xUllpOXpwdHdC?=
 =?utf-8?B?dlpaNXZLYmNmNXhCL3d3QUcyclczSFl2L1ZmWXBycmw1OTZXbW1XbzBEZmQ1?=
 =?utf-8?B?L3Ava0gzWGxJdVhPK3ZreWExZTRGcjNDTkcxd0gwTHFvK1l6RVZPTUlQMkQv?=
 =?utf-8?B?MWlKQjR6NzFkUTNrMkN5eEZMQk1GQzdoM2t4cHlPeUtuc28wTk9EUC9lZWQ5?=
 =?utf-8?B?aEVZTWRWWERWTWM4dG1OT1lGaFhrYUVUSXpZNzhiWDFNOWMzaVJZYW5ObmxM?=
 =?utf-8?B?b3BMWDRtOExPUFF2MEVndzR1bEh4S0FqYmpLbGEvWVp3L29Yd2dnRDhDTTlC?=
 =?utf-8?B?RVBrY212T0xIaUpobEg0TDBxckFEWTF0bzBHZVFmUGNObnhJUXlSUjRYbzVl?=
 =?utf-8?B?M1JuNVZBZnlDTDBlTGoxVTlqZ2F0bFIwbUlsbnNlZnkzVDg4UGQ0S2ZRKzlh?=
 =?utf-8?B?VHhRMUx0d1BQYmxxdFE2NkVHcDRnM2lmVDJZWmtHTi9ybEd1S2s0c2I3RkUy?=
 =?utf-8?B?T0NLQmxnRG14a1ZMWU0xWVo1ZlljUHFwTnFBRjZZMWFYRVFNeTNFR2Y2WWs3?=
 =?utf-8?B?RUhLRDZhdDFiR2xWUkQxTWNaNkx1eEZoQURjM0swa1dZNmUwdTN1djRFVTA1?=
 =?utf-8?B?SjFSMldrTVdPTUFYNDRCc1lYNjNkb25hZ2RVdjI4MDlhcnZGVC9QdmJ0TEky?=
 =?utf-8?B?TGpWQkVXaHZLRXFrd3JQNUZvTi85NGpGRXAwL1d3d08rS1RaQlluSFpmOVNw?=
 =?utf-8?B?eWVSNDN0eUpGV0Mxc0s1YUliVUorMy9vSG9manl2dzhsNXZwM2JuZWJRWGJN?=
 =?utf-8?B?anJITXhuRUpUSHVmSTVSUUxEakpHNzB4UWNETUlRT1pYYjArZXl4WmxDaGpE?=
 =?utf-8?B?SkozK1g5TjhSR1NGVE5lZGpsRU1XUWtnTVNvb3BJV2VLSTREVndGVERVWGNh?=
 =?utf-8?B?N0V0UHNxbWNKaUZsUW9KczRqV0pYemEwWDllSHdjZGNCOEZYcGl6RFRCYnF5?=
 =?utf-8?B?RGNEWW9FNjVzVm1wMklYc3RKNHd1OGM4dWVwS0Z2Rld4dDBnR054NCsxc3FZ?=
 =?utf-8?B?Q1lzakFMMVdMNVdEZFNmZGFkZ1I4RjhmZmtlR3VOd0w2QUNrVVd6QUtjcmw4?=
 =?utf-8?B?UmxGWnA2ZUE2MDErSG1yWFFvV2ovNDQ4WEJlLzdCWnhHNDkyWk04OEVxeFJT?=
 =?utf-8?B?Q3JsSnpYTVIvMDAwcTRxOEZKdWMxcmw2Qk5FRlkzM2h0SFFjRW9HZCsrMXlw?=
 =?utf-8?B?cmNTb3NpdzFPMlAwdnl5Tjl0OGpsM0ZxLzVuK2U4enNteWdxQ25iQ3lpZTRu?=
 =?utf-8?B?SzJyam12MkdRaU9SVjMvVFZjaEZSSnc1Z3JXL1NNUi9WMmNGMjRvZGladlhl?=
 =?utf-8?B?bjd3YkNXR2Vxc3hzRkVESGxONDdBWEM1WnhLZXY4S1FCYVYwSU5wYjVEb25B?=
 =?utf-8?B?dEF5NU5ZOWNhbWRqUnYyQU1iZUc0Q2cxQkR3RGFsQ1U0Qll2UWtCLzBpak44?=
 =?utf-8?Q?LbBR2w3kgfv0ZFCtOdhEw+an5?=
Content-ID: <E20572F5CA14F145892642055954ACDB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76c48a0-5560-42cf-0b22-08da902e2633
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 17:35:10.9808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hniry5rVie9lqzo/bgPVCNOrqcvsKPAy3oTIJ07JkyyEaZ0xPKICQN0UckefZIvB+w15TOwcAWFja3mR+20YiDxDjO8oxlD9DRgl4T8Ogdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_103526_254034_BFDF91F9 
X-CRM114-Status: GOOD (  20.43  )
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

On 03/09/2022 17:23, guoren@kernel.org wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Xianting Tian <xianting.tian@linux.alibaba.com>
> 
> This adds support for the STACKLEAK gcc plugin to RISC-V and disables
> the plugin in EFI stub code, which is out of scope for the protection.
> 
> For the benefits of STACKLEAK feature, please check the commit
> afaef01c0015 ("x86/entry: Add STACKLEAK erasing the kernel stack at the end of syscalls")
> 
> Performance impact (tested on qemu env with 1 riscv64 hart, 1GB mem)
>     hackbench -s 512 -l 200 -g 15 -f 25 -P
>     2.0% slowdown
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>

What changed since Xianting posted it himself a week ago:
https://lore.kernel.org/linux-riscv/20220828135407.3897717-1-xianting.tian@linux.alibaba.com/

There's an older patch from Du Lao adding STACKLEAK too:
https://lore.kernel.org/linux-riscv/20220615213834.3116135-1-daolu@rivosinc.com/

But since there's been no activity there since June...

> ---
>  arch/riscv/Kconfig                    | 1 +
>  arch/riscv/include/asm/processor.h    | 4 ++++
>  arch/riscv/kernel/entry.S             | 3 +++
>  drivers/firmware/efi/libstub/Makefile | 2 +-
>  4 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..61fd0dad4463 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -85,6 +85,7 @@ config RISCV
>         select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>         select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>         select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
> +       select HAVE_ARCH_STACKLEAK
>         select HAVE_ASM_MODVERSIONS
>         select HAVE_CONTEXT_TRACKING_USER
>         select HAVE_DEBUG_KMEMLEAK
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index d0537573501e..5e1fc4f82883 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)          := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
>                                    -fno-builtin -fpic \
>                                    $(call cc-option,-mno-single-pic-base)
>  cflags-$(CONFIG_RISCV)         := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> -                                  -fpic
> +                                  -fpic $(DISABLE_STACKLEAK_PLUGIN)
> 
>  cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
> 
> --
> 2.17.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
