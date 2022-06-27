Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90263C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Jun 2022 05:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4RzKzFwd1wE9KUGwcbG+YI5pB9+WVz5rUo6eiaeOnk=; b=WQoMKoTqFtyaDL
	TZqFIx/eVFrPuIbr1xv66Re/FSXUlCPn78Vy9zozS2ZfGhTKm7QhZLvK0cBVg54FgRVWorEEfipkA
	SURPR7L1CKkp8aftU2K8lVGyqGZ98tRDb96DXVm++hD5BgZ8DnGCpaH4pff/c9JEYoTUMfbusDlPs
	sguy3kheBl2EALLHfB9bHhZ51oI6Tx15A+AO/xaqJqWu1C2fgLCaIRrFKxsIlnUJ1XMPt681U3AR4
	VzqkLh9yQRhdMuSzrgSwYex3YKkJ6u6hClSDusBelx8pbL9tpt2SmIsIX9yZqjgNN3nyqThVl3tHC
	zcuxAGiROJllWO+vvF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5hbc-00FqJB-Ry; Mon, 27 Jun 2022 05:48:16 +0000
Received: from mail-eopbgr90074.outbound.protection.outlook.com ([40.107.9.74] helo=FRA01-MR2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5hbL-00Fq7f-04; Mon, 27 Jun 2022 05:48:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HC1/g1GGHXwwCOCgGC6nwolODvrstTCS8V2W8MkEWthHiprC2DNHO3xsfsBsfCx0U9eqgh452M/ko5hHWAcZe/CbBZiDp90FPm5MkSmiTN9KQpw5aIpisr9nTTSHnw3P067ormALeWOeiZfnsu9T592EdkhKqb4HZWS0BVFUflyZUM2JFzGglrI/qFyfxJ5tN7bBlqfuOZPJjQxl+dyd82mMzZK80b33PFhHTChcyQ9IPopMC309H6Kn8U24SIRFhJxgHdkXIPWrPxCTcBOK5V1rsI6X1568MIcsH5kOwN1IfY+J3PBIinOkaspmGxq2ETn1fvz5aVrNTrvdOLn4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfYSl4qh9R8yxDux1R7YaIf7ET2NcfsheuRSOqYrQws=;
 b=CshN1G+qslKTX5BPTYwfTbrDVDG4yjeZQZIT2rQxIWVVNlmsQsFeYXDnYnvkx1cLZWu9s4qAphPToKlFd1/sjOVpSEQF4uYmDjR4E3OippExqDn4vAZlXvnc+lTMighTwvJ148V7jIwsZMdMr1V9bhnfBSlizzIhcAZi1twEWSQsoWVYjPewH5OijfQXVaeQzxA1PIu+fPY4dWmO/7aVGciB1Zy5A+8UZRC6WZogfs/jRgbVd1N25pYjZht+OhzlcscbQZpgaJ6dc40hpbvimFYnKbRqBkev39ofC0Mo5GNQtlYYGe/LIxeR6TVGCckvTwOAzy2Z/V0jcs3w4F1NYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfYSl4qh9R8yxDux1R7YaIf7ET2NcfsheuRSOqYrQws=;
 b=fiPML7yIunsuVQ7NHFvHdsjxbnYaZq17YKfjX0xpEL6jCEM8Lpp9AfpyqYrTCusQJ7nlJ18evH+CP/a3BGTd3fc8U0cMwZYNsMFopt+cqO07YgBgM6lzpDA+F7Y/TKbwDiViwCLs2tLWuaS6tZbCW/er+Ols0OgVET55Rh1W4k/doe5JsGcYFnzgM+BfJjSVm29s18QSlnU/lOepF00IQ8RJ6kmfAohyQ4GbwQcLyfFbMjhH8yT7qcgN5quPJVLJ2yczfsIen0NyTPeCQvsbDTcAOsH/mdfoMXvJwY2hHejTe51Qqg3o6vBw/JSrlKBrj80zoPhrlQMkEvfpIQUAEw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1617.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 05:47:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:47:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
CC: "hch@infradead.org" <hch@infradead.org>, Andrew Morton
	<akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
	"linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>, "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V4 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Thread-Index: AQHYh4UNHiul1udyy0yTAklDcjRsDa1iw9kA
Date: Mon, 27 Jun 2022 05:47:55 +0000
Message-ID: <f8140a0e-ab09-fea6-5a2f-76140b101482@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-3-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-3-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ff4e470-c5ee-483c-79c1-08da5800952e
x-ms-traffictypediagnostic: MR1P264MB1617:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  I3urCZw0Xvlsg+OcTyCYQ9j+Auv5SOCLfbUY/yS/zRdvcRTNWgp9XInZcDUkZ2ZHF7/AVoFh/1xF9AT+AAvMxF8m5l5dFH+DKbresMWCwmJVLRd428OPubzZ9VZO0vpkIUdhpoDRI0rjsKyxYaIYlZupKQkmKb4NI5ZTTAmJCM6G3ubU7chObiwBLMAwdYf9sGWHmroo+rc/MZnDk55cIRwlZFFrNum3VZirpE4PkFInm0BsNiYu6L3hr6gr4PCBeJo0Z1OZbuiVFOgS9pH7PmHwdzTKcgYATAD1/uMJNlXmrFXEw2g4V29gDOUNEPiqPi4wJbx0ZJsjh4BLY5cfW8PFTvk8thPMzNRfxQBPaaxmI+T+DexEEmUBlrkf1cFnKtINBjlJlc0QPehp3ujfXdWlFuPk8CIjOV+xnx9344DQje5CPSQzMmVM3sipbbjmkmlkSRSIngH2Q71tvCcrOI2Kk0wE9xRfXU1/6tYEdyCjNwGVOPYMvoHam2VDlT4h3H+dAMohWraaZT8wOI8dxMKWnl3uY8HdCdSsw5RXAfGu6qXpowQ6Tnaw/0IomOH9GydC8KxjKrSzrF0uKKVSrLNhatQnfxczSSPEOWLqmyDwZu5VDE8csoCb2oW9FLF458rbgodbbjIodQO5/BfBDH34XUZG75xuBH7EaNb/GFQW/bXG5gzAqo/HuTUitLCKeBUzanTKg206rCB+BG/mMfgOsUuaYBG9tr6u326Bpf06dD6Y48L073GLL10tO6ri9smcXfWUXpKIo7OmJSA67TYuyysUZkrlZAhrdVK6I8OOAuNEeJwi8wjHPR2RiJAOl7eEwgL88QUQgahIy3eh7Nai1Qy70P+8vWdF48RYiLY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(36756003)(31696002)(86362001)(316002)(7416002)(2906002)(122000001)(54906003)(31686004)(110136005)(6512007)(6506007)(26005)(38070700005)(6486002)(66556008)(76116006)(4326008)(38100700002)(5660300002)(66476007)(66946007)(66446008)(8676002)(64756008)(71200400001)(2616005)(186003)(41300700001)(83380400001)(91956017)(44832011)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TTB2cW1xLzdzWlVORWJVbjFxVEdSMmZaZ1dBTXNwWXFNWnB5UUNvaDBQeWVD?=
 =?utf-8?B?WkpaTmZETGFtOFd3ZVZoY0lSOG16RVgycU93Sk1BaFJFRmtOSUh4MzFiRzIv?=
 =?utf-8?B?N05XUlhHVE94ZksxYTlCTzlJS1dZMWtkUSt4d2tjb3c2Vjd2RWwzY3owZTVL?=
 =?utf-8?B?N1JNSWxuVzBrMmRLRElWbU5uOE12eFF5WENiOGZkYmFEcU5zNm53bmlacDNZ?=
 =?utf-8?B?TE1aM2ZlbGFFTG11TzNrbWpBRE14MWxWM0RxUmh5enlleG9KYms5UEpYSnpT?=
 =?utf-8?B?RXYrWmIyV3ZGOHNJeGprSGdVMzhBTll5Yi84VHU1aFQ0VjRrL2dQTG00STZ0?=
 =?utf-8?B?c0prYlBrSFFiYjFCWHFJV3YvYjN4VDh0dG5RSzErb1ptRHp1Uk0wYlc4WENh?=
 =?utf-8?B?K1lZektaWkROMjVQaXRiZmNIcnhsTzMyY0NzT3d6RGp0OUQyZnhRNmovZlRH?=
 =?utf-8?B?S1dVZ01SbjE0ZHdCSktaZi8zak9teWhncG83WW5jbExyWWQ0UGJqWFNTVy93?=
 =?utf-8?B?VG8xbGJKcGdqbzFndmQyRzJvUUcwaFFSOUQvcWhEcUU2cHNCSUU3TnBzMml4?=
 =?utf-8?B?azFlbHF6MkFQNll1dVhCZWkxSnJSRTJQaHVWWVRBd2VPUzY0L2Mrd1ZRSTZO?=
 =?utf-8?B?TGlQK2J6RC83ZHFSZHAwTWdhZE1sTk1qZVQvaENDZU5hNWF6KzBNR3VRb2Nn?=
 =?utf-8?B?VnFKYXVZWFJOTi9Vb2xRMllHOEhhM1U2WXl6TnV2QTZlYjBCR2lMTzVJcllq?=
 =?utf-8?B?d1JDUW5td1ljS1M4VmxPcDFpV2tlR1pPaDNsRzVOaFlPQUNveXlJUWxlMWQ3?=
 =?utf-8?B?dWZEVXF1emx3L3dRWGo0czZNT0VJNnRBNVpXWjRRd3plZWljVXkvanNhK3M0?=
 =?utf-8?B?cUliMjJ1Q1ViRDQ3YjI3dzh5ZnI5c00ydUdMTmdWanJqYWUyNnRFNk5ybTMy?=
 =?utf-8?B?Vkl0ZDZhMlltMmh3UUQ5RFA5MFBXNjErMWxsZkkrWkkxTWRFWkxGTUFldmY0?=
 =?utf-8?B?aXZOVDYydGxSRXlYMDBDa21kN2FoWHlEeHp1RUo0OGU3TitsSGZiMU1TUUlT?=
 =?utf-8?B?eG1iMFJES0QxN2wxaUdxcUx4N01yWmJzOS90bis5Rm9pYXU1MUNtaG9wQkVY?=
 =?utf-8?B?bER0RzJSby9TZFdMZktzSGRJaXI0NTlnZTROMEN3M0VzMjkvWWVXbDMxKzQ4?=
 =?utf-8?B?T0I3dGRBRk9WOHphb2VaYkNRWkhtQXFjT05HZUIyL00yQjJTZ2VRL21uVm9u?=
 =?utf-8?B?RnRJSGc3NTRRbTJSZi9sUDh4NUxWbHh0bGhmTmpudklnNm1wc2tOd0oyZDBm?=
 =?utf-8?B?ZVhRT0VHT2h6YjhvOVpkM3N6N3pVZVlxYVFDbStTTlNIaVpsUm5UQW11VGgx?=
 =?utf-8?B?bW5ON1MvNUFuUURGVHFnamtZV3UyRStLdHBFZHhMV0JyajV3L1BVa0QzcTJR?=
 =?utf-8?B?QTJVTnVFV2kvYlF0Wk9OMmVLVkYzb1puVElMWjU2ZlRUcUtGaXVTVGxhRldG?=
 =?utf-8?B?c0xtcHczOE40MkxjSThRd2lnYlI1WVR6cVQ0WVJhcjRDVURvVzRXWHFCY3J3?=
 =?utf-8?B?VzNlMElsM2k1all2SG4vVG1jVUxWQ2FYNlhqZlFBd3p3VDB3YlRjVDVQR0sz?=
 =?utf-8?B?dmV5T3l3VDJSWUo2NTBUblNhZmNXVkkyTE1qY3RVYlJ6T1BEMHhuUTlZa3A0?=
 =?utf-8?B?VE9IMjhLYWlEbUdPWFU2WXJQdXVJRllrSUkxNkhkWDNYMkVEY3Q4UVpwQSsr?=
 =?utf-8?B?WGk2Q1VqZmRYUnc3TExkMlh2MnJXbDRBakNjKzBVZ3hKK0VzbC9BS3NiQkw2?=
 =?utf-8?B?QlRxSTJSRUh4V0ZkZHBBTUdERHpLTDFPeENZK1FxV0x2MHhSd1hzdnJGaUdi?=
 =?utf-8?B?Z09wd2hlQktybEdnSmxzNm1VYUExWFZPRWVmaFByWTdvZXpXVjgyc2k0bHpM?=
 =?utf-8?B?Rm8xbjBMVk5aZ2hnVVVMNU4xa0VEU1FxYW1TYTNyWmpkQVRKcUhMQ1kwWGZl?=
 =?utf-8?B?alFybGgxZUZJZ2g0aDVXOXh3Q01Kb3Vzc1FwYktVTFdFSzd5YzNtckV5RTdv?=
 =?utf-8?B?UHhyM1gvcDJ6NFZ0aGx2cGYzUnpFN010ZStmckRlVGZObm5NSHh5cTkwVU9y?=
 =?utf-8?B?WEIrUW1jSGUvQ0hxMFNDN2dZRzMvOG9KN2RQL0JTOUg4L1BwYkQ2dzlFUk9M?=
 =?utf-8?Q?nASsWuF0AO3bq5Xr2GJ53yg=3D?=
Content-ID: <230C2B020B0A15489961D1E87AA2FB16@FRAP264.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff4e470-c5ee-483c-79c1-08da5800952e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:47:55.1973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F190iAVeh247AlQg45X4Y4mcUP/hhBVqlHBuZkROuvCaIruYz4z+P43+l2qI8DfU3dlOfdkgfm0MWU0snXDTheu3PEQq6iVintdNwmE34Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_224759_107254_815DE456 
X-CRM114-Status: GOOD (  18.45  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoaXMganVzdCBjb252ZXJ0cyB0aGUgZ2VuZXJpYyB2bV9nZXRfcGFnZV9wcm90KCkgaW1w
bGVtZW50YXRpb24gaW50byBhIG5ldw0KPiBtYWNybyBpLmUgREVDTEFSRV9WTV9HRVRfUEFHRV9Q
Uk9UIHdoaWNoIGxhdGVyIGNhbiBiZSB1c2VkIGFjcm9zcyBwbGF0Zm9ybXMNCj4gd2hlbiBlbmFi
bGluZyB0aGVtIHdpdGggQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gVGhpcyBkb2VzIG5vdCBj
cmVhdGUgYW55DQo+IGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcNCj4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFu
IEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAg
IGluY2x1ZGUvbGludXgvbW0uaCB8IDggKysrKysrKysNCj4gICBtbS9tbWFwLmMgICAgICAgICAg
fCA2ICstLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUv
bGludXgvbW0uaA0KPiBpbmRleCA0N2JmZTAzOGQ0NmUuLjIzNzgyOGMyYmFlMiAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9saW51eC9tbS5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaA0KPiBA
QCAtNDI4LDYgKzQyOCwxNCBAQCBleHRlcm4gdW5zaWduZWQgaW50IGtvYmpzaXplKGNvbnN0IHZv
aWQgKm9ianApOw0KPiAgIGV4dGVybiBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl07DQo+ICAg
I2VuZGlmDQo+ICAgDQo+ICsjZGVmaW5lIERFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVAkJCQkJXA0K
PiArcGdwcm90X3Qgdm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQkJCVwN
Cj4gK3sJCQkJCQkJCQlcDQo+ICsJCXJldHVybiBwcm90ZWN0aW9uX21hcFt2bV9mbGFncyAmCQkJ
XA0KPiArCQkJKFZNX1JFQUQgfCBWTV9XUklURSB8IFZNX0VYRUMgfCBWTV9TSEFSRUQpXTsJXA0K
PiArfQkJCQkJCQkJCVwNCj4gK0VYUE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7DQo+ICsN
Cj4gICAvKg0KPiAgICAqIFRoZSBkZWZhdWx0IGZhdWx0IGZsYWdzIHRoYXQgc2hvdWxkIGJlIHVz
ZWQgYnkgbW9zdCBvZiB0aGUNCj4gICAgKiBhcmNoLXNwZWNpZmljIHBhZ2UgZmF1bHQgaGFuZGxl
cnMuDQo+IGRpZmYgLS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMNCj4gaW5kZXggYjAxZjAy
ODBiZGEyLi41NWMzMGFlZTM5OTkgMTAwNjQ0DQo+IC0tLSBhL21tL21tYXAuYw0KPiArKysgYi9t
bS9tbWFwLmMNCj4gQEAgLTEyMywxMSArMTIzLDcgQEAgcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBb
MTZdIF9fcm9fYWZ0ZXJfaW5pdCA9IHsNCj4gICAjZW5kaWYNCj4gICANCj4gICAjaWZuZGVmIENP
TkZJR19BUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+IC1wZ3Byb3RfdCB2bV9nZXRfcGFnZV9w
cm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3MpDQo+IC17DQo+IC0JcmV0dXJuIHByb3RlY3Rpb25f
bWFwW3ZtX2ZsYWdzICYgKFZNX1JFQUR8Vk1fV1JJVEV8Vk1fRVhFQ3xWTV9TSEFSRUQpXTsNCj4g
LX0NCj4gLUVYUE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7DQo+ICtERUNMQVJFX1ZNX0dF
VF9QQUdFX1BST1QNCj4gICAjZW5kaWYJLyogQ09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BS
T1QgKi8NCj4gICANCj4gICBzdGF0aWMgcGdwcm90X3Qgdm1fcGdwcm90X21vZGlmeShwZ3Byb3Rf
dCBvbGRwcm90LCB1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
