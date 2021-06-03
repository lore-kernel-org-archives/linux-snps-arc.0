Return-Path: <SRS0=tXg0=K5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831DCC47096
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 19:35:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7DD613F8
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Jun 2021 19:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B7DD613F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WOEVL/SjOPy+64T4hYELW4vOr7G/UkQZFFMY2ck1vBg=; b=DBcK1i+lET00PdpNaym66/esVj
	l/QgE0JsXbLpWNm2L4qritL+pO/tSKZSIikXgoShfVKO9L5yjpSwBn7c9sibFBA4LZ5g0Y3in8nuH
	OGDNXTpgukSyPA8OXgPc6BMrptW8GLxbYRUB6av61ydR/4GLqGzSJT1oz6Vwzp+8J03ba0zOZZljv
	fQVgKHkGCmDpGtWSm60jjZuYfJsBfk8FaSpX3ajrH69Woggl7lnn8dLT/u+PTzS8epCHikTuDCaZF
	4nAPZnCqK2AsTguEcbLffmyyZoSTrB2QVthJsAvnaTtVvdYqOHJb4JRRbHe9QDeFoPiDnViGl2PzW
	RQGQXxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lot85-00AKZM-IL; Thu, 03 Jun 2021 19:35:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lot83-00AKYa-5L
 for linux-snps-arc@lists.infradead.org; Thu, 03 Jun 2021 19:35:44 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A7B89406E3;
 Thu,  3 Jun 2021 19:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622748942; bh=SZC6d9fuAoRWIgk+YzqfpbkIAe1StVA8hnmWMqq9CUc=;
 h=From:To:CC:Subject:Date:From;
 b=efCQLiZNCJ3GIZ54Ch1seF4nHDHXnyaN5tRH/2qJZKVCdVdhXPxvUjX8OCngwHDQ0
 M1/JrgIkn6zGMBU5A2NdEDtJR98SuFnX1sbruMDi/YUEODgxCw3CrxVG0EzL6yeg4w
 i8zf24GcJlpWAiRC9i8IlBpIUhJLDu1d3vM8XTp1i7HF343BGJSSvbeYBQrM331033
 znvdrxlCpu1/nbmUfMvcu7V1Md1siS925//GwwUrbdJjSymPUflx3VL32/zdnkaxkk
 INPci2XvgWKsU4UYlW3r44J5+AplPvM97/P07amS4R90D7dAJq+7mRkvFBDgDx1nTJ
 jMxTaZsetaSCg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0ED5EA005C;
 Thu,  3 Jun 2021 19:35:41 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5E9B1400CC;
 Thu,  3 Jun 2021 19:35:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Kh1AY0u5";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgC8RPqbZobms8KOLUjMLtHhtJdVIQP5R/+co/7jhSzWLWUcNNQcBloRh7No9YAMJBVbTS23Pgfr/a9qQpWVTcw04TvOLQNsrQ5lSJT3BpFyaEk7Xttx0HRoGBktm8afKPS8/407Y4wJGJBjsqjdI7FEjEENXoxVevMcrFvhMAUT/a5UbfHmGyc5CfuoB86EErpJgJz2vJ2tYF3XrIW7TGPZJ3/qXtq5kqlZxgnV9K2L7JbFXN0Pp1bMZc0aI2ldO0HQ3LGKyjR50pp2FIPZy7KLkm1cGVDmobLGLYbC0xhP4YzzVebUld6HTCpdr4IduFD7+3gt0ov2DrfTiR4ikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BId43HJsjExnIO8oEoHW5kOL6P/6AxKiPwspoZJb6z0=;
 b=Q8b5Ek15RE9ewkmBZNUF7Xbz6pIXxSMM8dTAMQ48Hf4Iqc5KDePmNr9zK4vJg5Fa+CN74BLrkD7OHFFRkdmisRIuZR+OY7yr070RCMD6wKDvaLMkVGcGnp9txiM16qCaKsp2pMPEdAIKzOgabo+YTSHikeTf/6LpMGPmGR+0OdExu0uOCumg0226UGbh2jpKPXFJmBV9Db7Em1gGLMa5Vkwu1DpVO2p+/B4vaR7Tm2PIMq5lRXObkqoDW1ulcjR+99zK/NEnsk0iNQVSM0LZYWc11t6lKJ4HgvPCJDKUl9K7eeQ10+uKcjxtW8fXfAgaIUPYFL/8T2viJWYzvVT6WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BId43HJsjExnIO8oEoHW5kOL6P/6AxKiPwspoZJb6z0=;
 b=Kh1AY0u51396nupJbNVUmexWAWioyezEiKaIhmBzUkA6Nx4kkmprCY2HJWqVcOOYd4jtbHj467M/oPfRqPx8APMpzPkSfYd5rokU/kt0VSgjXgxZ8yd224Wg+rcrFpoSmt/e82HL27QgS+SJM59wxjyTFVYp/4pYwFbKc+06UcE=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3048.namprd12.prod.outlook.com (2603:10b6:a03:ad::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26; Thu, 3 Jun
 2021 19:35:38 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Thu, 3 Jun 2021
 19:35:38 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "bug-guile@gnu.org" <bug-guile@gnu.org>
CC: arcml <linux-snps-arc@lists.infradead.org>, Helmut Grohne
 <helmut@subdivi.de>, Guillem Jover <guillem@debian.org>
Subject: guile: Add ARC support
Thread-Topic: guile: Add ARC support
Thread-Index: AQHXWK+hJ1Or7h76W0KQeccOp25Lxg==
Date: Thu, 3 Jun 2021 19:35:38 +0000
Message-ID: <b2587129-d905-905a-94c3-acd3f9b9187b@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: gnu.org; dkim=none (message not signed)
 header.d=none;gnu.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b5f4eb8-42ca-450b-b99f-08d926c6c451
x-ms-traffictypediagnostic: BYAPR12MB3048:
x-microsoft-antispam-prvs: <BYAPR12MB30487EB20DDB4E970E68524AB63C9@BYAPR12MB3048.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZpJeG60Myi2kGlj4GPmNwUPGF1wb0tPr99GQ40EGnc9efoBhrk29/Poo8WDegIf79D7a21c1yk/0LuNve0om0FGSXSYIUlcbkzmKsDW1tx3qb0u72rx5fj120F3ODt9rPnI53RUor7dPiiXehcR4rIVBVdzVq90zUvPF8zb1KSqobw90CD9DoE0fGb5VtXTp26XUUnLmkY4gSnKfwl5+zFXGV3BHYwFU9hzLxt9/4FqbtgN0LlV88+odSubNDy95qtgsNKEUy5DTGTz78xeqwoPdrRuHXMg6v+v0cJxlcn//je+AXYrA0xfWfzYPwM/HJPqVAUfAp/QBeoYy/gCHVtHNETOtmgkH70rEcKoVNfOVVwQJCHSlPb87gH4SbQ2rtwRM6BWtyqvmEEccQx6/+JmGo3SJERC9GiQ7VN+PaHDi8sxcbllBYLsKn5umqYkMJdRxHyVBeP4e+gDdzRf8fpnN9/JJE5n67QxAXh3+obufcnFBT0AdpOJumm+jft9VHPWolK9cZondUEjkZt2FuDhfmF9AzJANStGJqQz5teBCszNzpc5sB1xb4FNPlYOGyixf7K0YwvjmbH9BVResCRzK6mB+1Nzekm32EC6BSTyvLgq3FIEc/ONgYgZSH9EWtEQWIN011C9LSwlzbM100kQlOmY+HTGucAA4qYWR/6wC0V8qQ8oHe6V8L7+hCQjp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(396003)(376002)(136003)(346002)(26005)(8676002)(186003)(8936002)(6506007)(2616005)(6486002)(558084003)(66476007)(99936003)(66946007)(2906002)(66616009)(64756008)(5660300002)(54906003)(6916009)(86362001)(6512007)(122000001)(66446008)(478600001)(38100700002)(4326008)(71200400001)(66556008)(76116006)(31686004)(31696002)(316002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RjI3dnVUajJCV0dvUW0yTWZGd1RITW1XZXNsa1RsNWVxVW9jempYNjV2VDVO?=
 =?utf-8?B?bkpKc2k4UTBteWJzNzE3QkgxdEZCRTZQYjExWlFDeVJaL1V5SktaaTZSUzZH?=
 =?utf-8?B?Y05wbFR3NFpTOWtuMnJtUEZ1dWRKdzFYbHM2U2VBVGYrSXh2d20rYjk4YTVm?=
 =?utf-8?B?VmZ4QWh1aURLa2FhRmxpenltZUU0RVdoQmFjaER5ZEJTRWF5OXlDVmtzNFh4?=
 =?utf-8?B?NURQNXVXbFpLVzEzQVNFdnh5T3Q0K25wVncrcVhIREhmdWcvUXI1R2N3S2Jp?=
 =?utf-8?B?b3dDYm5PRENYcmNlVk9BcE5rK1B1dmwxejZQVTRLTEowbzh1Yit1TlN6NFN5?=
 =?utf-8?B?N3J5QVVMdUw1djdXWUlWMFg3eHo0Ymp2RGdrYjRDTWx1RStvR25tdmRuU3J6?=
 =?utf-8?B?d013QTd1YnlDTWV6SjBDSldEMVh1azJOcFRHQVdaVmxDY1JlYUhJT1QxdnhZ?=
 =?utf-8?B?eE5JTFdIcVFlaksrSkpaSUpqaEpsMkpvZ1R6Q2N6V2M0djVWR2tXUTdTWjZi?=
 =?utf-8?B?L1AwZllZTVZsWWJ3TXplRXM1ci9GSkk3ZjR2S01jdmw2Y09QT3U4WVgvVVBC?=
 =?utf-8?B?Tno1ZlJiS2dDK2ZDc2RKTGF6anN2ZlU5Qjg5UHpsaE9qTDEwV1VNWnJkRlpU?=
 =?utf-8?B?bFdXN2gvbWdZZHNqMUZXbFVuSjU2N0RyUU9XOExiVktHSmxxMXZjRTBFRGls?=
 =?utf-8?B?VmdEZnlvdUxUQTAxaGJQZjh6TG1BZEZtNEpSQmVaR2RtQzJMd1g4eTFwZkJM?=
 =?utf-8?B?b2tQOCtONTJtSndNcC9UaWoxYzhCQ1ZaZXhNQXVHY25XdmxKYlhkMHlGaTZj?=
 =?utf-8?B?Nzd2UUpOcktrSHg2amo0WnE1c0tRaFdBZzNBM0tOTzhhVGJUN05WeTJYOGhB?=
 =?utf-8?B?cnhmaUFVeG0wTHRGSEE1WXNndyswZ2tVeGNFdXpMUEpES1BHK3Y5Z0N1aUJG?=
 =?utf-8?B?UnY3ek02UklpNW91VjBmZXBMYnJhRjVsM0ZwRFlwdTNtOTExcDZYcFpRZ05j?=
 =?utf-8?B?T2ZJNzBpL21SeTFFVE9yMUlHb2ZUZCt3b3JrS292cFNkeHh2TlFnMWJ4T1Ny?=
 =?utf-8?B?V2xueVhkcVBWTTNlemJ5L3V6b2s5bm9CbU1NaXhWUS90bWpPdmlkVnBYdDhR?=
 =?utf-8?B?dXIxdGJBeHQwcUVMcmZVU0RmTGZCcVRNbFQyOXgwRkhBeE1jeUltRDdIOW1x?=
 =?utf-8?B?Ym1BNDl6eFZUeS9idVhLUVBDTHFzZC9qRVYyNnhkUTlhWmhvRFR4eVJ4UnA2?=
 =?utf-8?B?NVU1cHR6ZkR5ZDgzZXcyREFLZkp2UFNadXp3MnN0UmdEdmdYOGpDSTRpZ2d1?=
 =?utf-8?B?aFNESHpCbmFWNWh2eFF3Q1BvSGVRYjZMNE84ZnhaMDVjVlJNc0JiS1hsMysy?=
 =?utf-8?B?RUk0ci9yd3hnUU1HZHVyUzdtQnNVUGNQR3VwQzVLY0RDeUI3ZzhpZjR6d3RC?=
 =?utf-8?B?UmdTRWFZV2gxeVNsbjRQaFR0SS9MblFwQnRtMERBT1JCTVI1Sk5OUUd1UTRl?=
 =?utf-8?B?YTM2Sm9md1EyRVdGL3djanpNbk9oekVqZ2s1NEZ4ZXVQRFR6c2FZaGZ2dXpO?=
 =?utf-8?B?bVdSQndOTHhuWGszakt2Q1F3bVBGbGM0bTF6RDcySVV2TkpXTkpHUW5rWUlt?=
 =?utf-8?B?cUcrRGI5NDNDZ3RBVS8rNk9IdFByaDFVUHFPN0ZCWDk2UUc2SUFBQ2VTYk5y?=
 =?utf-8?B?aUhyanFQMFRzbHpKNHIwNGs1K0pSMWFKYXAzaXE4aXNDS3FsUC80UXBXL3Az?=
 =?utf-8?Q?2cB2rzTHuLNY3eHwPw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_b2587129d905905a94c3acd3f9b9187bsynopsyscom_"
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5f4eb8-42ca-450b-b99f-08d926c6c451
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 19:35:38.7197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aswQmM82Ib6dKFwqIDMJdCvfZ3szgQJ/mLiftPM3/7p68tkO7/54Ai+NHwV594yG7jgNvx2SkN1EDmvrLuISSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_123543_264789_095B7D55 
X-CRM114-Status: GOOD (  15.89  )
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
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

--_002_b2587129d905905a94c3acd3f9b9187bsynopsyscom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <18C59A9EEA52F7428832FFF522E5D0CA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCkknbSB0cnlpbmcgdG8gYm9vdHN0cmFwIERlYmlhbiBvbiBBUkMgYW5kIG5lZWQgdG8g
YWRkIGFyYyBzdXBwb3J0IGluIA0KZ3VpbGUgMi54IGFuZCAzLnguIFBhdGNoIGF0dGFjaGVkLg0K
DQpUaHgsDQotVmluZWV0DQo=

--_002_b2587129d905905a94c3acd3f9b9187bsynopsyscom_
Content-Type: text/x-patch; name="0001-add-support-for-arc.patch"
Content-Description: 0001-add-support-for-arc.patch
Content-Disposition: attachment; filename="0001-add-support-for-arc.patch";
	size=1543; creation-date="Thu, 03 Jun 2021 19:35:38 GMT";
	modification-date="Thu, 03 Jun 2021 19:35:38 GMT"
Content-ID: <C814B3E227F4914B8EF9FE5EF2D6070F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSBkNzIyOWQzODRlNTAzZDdhMzg5M2UxM2U3MWZlMGFkMTZjMmU4MDAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lub3BzeXMuY29tPg0K
RGF0ZTogVHVlLCA2IEFwciAyMDIxIDE1OjAzOjA3IC0wNzAwDQpTdWJqZWN0OiBbUEFUQ0hdIGFk
ZCBzdXBwb3J0IGZvciBhcmMNCg0KU2lnbmVkLW9mZi1ieTogVmluZWV0IEd1cHRhIDx2Z3VwdGFA
c3lub3BzeXMuY29tPg0KLS0tDQogbW9kdWxlL3N5c3RlbS9iYXNlL3RhcmdldC5zY20gfCA0ICsr
LS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpk
aWZmIC0tZ2l0IGEvbW9kdWxlL3N5c3RlbS9iYXNlL3RhcmdldC5zY20gYi9tb2R1bGUvc3lzdGVt
L2Jhc2UvdGFyZ2V0LnNjbQ0KaW5kZXggMjA4OGNkODY2OTdhLi44YmRjZDY2MDM5ZTQgMTAwNjQ0
DQotLS0gYS9tb2R1bGUvc3lzdGVtL2Jhc2UvdGFyZ2V0LnNjbQ0KKysrIGIvbW9kdWxlL3N5c3Rl
bS9iYXNlL3RhcmdldC5zY20NCkBAIC03Nyw3ICs3Nyw3IEBADQogICAgICAgKGNvbmQgKChzdHJp
bmctbWF0Y2ggIl5pWzAtOV04NiQiIGNwdSkNCiAgICAgICAgICAgICAgKGVuZGlhbm5lc3MgbGl0
dGxlKSkNCiAgICAgICAgICAgICAoKG1lbWJlciBjcHUgJygieDg2XzY0IiAiaWE2NCINCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAicG93ZXJwY2xlIiAicG93ZXJwYzY0bGUiICJtaXBzZWwi
ICJtaXBzNjRlbCIgIm5pb3MyIiAic2gzIiAic2g0IiAiYWxwaGEiKSkNCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAicG93ZXJwY2xlIiAicG93ZXJwYzY0bGUiICJtaXBzZWwiICJtaXBzNjRl
bCIgIm5pb3MyIiAic2gzIiAic2g0IiAiYWxwaGEiICJhcmMiKSkNCiAgICAgICAgICAgICAgKGVu
ZGlhbm5lc3MgbGl0dGxlKSkNCiAgICAgICAgICAgICAoKG1lbWJlciBjcHUgJygic3BhcmMiICJz
cGFyYzY0IiAicG93ZXJwYyIgInBvd2VycGM2NCIgInNwdSINCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAibWlwcyIgIm1pcHM2NCIgIm02OGsiICJzMzkweCIpKQ0KQEAgLTExOCw3ICsxMTgs
NyBAQA0KIA0KICAgICAgICAgICAoKHN0cmluZy1tYXRjaCAiNjQkIiBjcHUpIDgpDQogICAgICAg
ICAgICgoc3RyaW5nLW1hdGNoICI2NF8/W2xiZV1bbGJlXSQiIGNwdSkgOCkNCi0gICAgICAgICAg
KChtZW1iZXIgY3B1ICcoInNwYXJjIiAicG93ZXJwYyIgIm1pcHMiICJtaXBzZWwiICJuaW9zMiIg
Im02OGsiICJzaDMiICJzaDQiKSkgNCkNCisgICAgICAgICAgKChtZW1iZXIgY3B1ICcoInNwYXJj
IiAicG93ZXJwYyIgIm1pcHMiICJtaXBzZWwiICJuaW9zMiIgIm02OGsiICJzaDMiICJzaDQiICJh
cmMiKSkgNCkNCiAgICAgICAgICAgKChtZW1iZXIgY3B1ICcoInMzOTB4IiAiYWxwaGEiKSkgOCkN
CiAgICAgICAgICAgKChzdHJpbmctbWF0Y2ggIl5hcm0uKiIgY3B1KSA0KQ0KICAgICAgICAgICAo
ZWxzZSAoZXJyb3IgInVua25vd24gQ1BVIHdvcmQgc2l6ZSIgY3B1KSkpKSkNCi0tIA0KMi4yNS4x
DQoNCg==

--_002_b2587129d905905a94c3acd3f9b9187bsynopsyscom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--_002_b2587129d905905a94c3acd3f9b9187bsynopsyscom_--

