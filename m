Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3506CC07E94
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 14:10:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F022761405
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 14:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F022761405
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsfiVpgEtZOPYi7eS5/a8DM8c4dAdYbZ465jWjcaTnE=; b=3iIMyE3pcSRPhC
	mBpqSAV+02DL3qpH8TjyicR2U9LnUVv5i5oJgfZFykHx1Hls0VT02eQa7rE3rscmzSGLqF551ikLt
	8C/gMGaQ29KYIhIojUxRU74zxGqLMb0oIOAIUHON8LA8/0MHFNdM458N+1yWrxcs10RgAQmu7o0Uo
	GsGqIzQ9BCLStrqdoc1HEzFFMXYRwlmdugmpvpBOjYA6JP/bD+37SRUQ0ZcHhpXNmnhweyvKKbUcs
	V6E6JEdZg2SINkqfq9VwLBOheiPiAyY+7hJAIbrSZkzA/phazBptRM3fQUzbASr2ikpAFJDB8D/Yp
	iumNTxpKZXDrr3UlpuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpAWR-00DsUp-PO; Fri, 04 Jun 2021 14:10:03 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpAUN-00DraR-H0; Fri, 04 Jun 2021 14:07:59 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F8D940802;
 Fri,  4 Jun 2021 14:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622815675; bh=/iWL2EUwUpDDPxZxHx0x/vjOZIshZIA6OpLIvaoqpqw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Ig0Tcd0IeA/j61iMEUSYCkWoSIh/PdwNA4zHXhhgjUDYGRk/mjcQsEwXaz0/IB0+q
 mYe3G6PDOJ923llXkjDyvgujHvRbUB8orz0QWTJCpb6YfjQSPPqMJJMXpCfskPONxX
 8ck29oymfwd/GQTriQ5O3D1at7P/mo8C/A4PpNnshBUOlFAhn/4PuH4RKsLquospn7
 TzoQjRqJMTe2fXRdVzkoHwKGX0kXtAJXVnmOUihWQ8w4uq+g14ILbJZwoB1i0FQr3w
 MWjlGRd+ScMyGrkeOLiOwuvB6sU9xImT2X0xfKodIu6fb0HpBpt7oGtn8rskBVwH2T
 HwNl+wqPHOlFQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 95D17A0080;
 Fri,  4 Jun 2021 14:07:47 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id A87F1800BD;
 Fri,  4 Jun 2021 14:07:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="ZU44du+A";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRwmBLWGZuy5GVa/jaUO6Lgpuzv92lEeNz/dwSiKmxBhx1YI9MJaTC6GTT8KHd5L/Oc4n2ig8zhvtPLMaLgMiVfFYDEeF2cUWluXpRukewgxtrCgrAli9QZmTU50gZwM2cIAIDstPWagpClLBN2waC4B99OdsEHUo1AbLykwCxpL3sJbKUAnKe0o80l5WJjc+vNCm5L0YbWN21joi+lr/ngX8C7iLfECKEIX9DRV8ggy19mE67ccVwvujRpV2pQs9Ag4B9FOBrqC5O/vWjuPgFFEJz9bfF8GP/lPTjFci9pnUtfyikg18efZtcAC1XXOy1ZIbpez6EkoX43lFtVtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iWL2EUwUpDDPxZxHx0x/vjOZIshZIA6OpLIvaoqpqw=;
 b=MQjwCHifCUp5BHBbLM/Y8hmWTX83vE+OjBXoNZ46YYpiZ2eSLBa1wxQgoKayTchwy8t1DrMkzsnPb21qwfUlbBNqf6R6rKmeYym1Tb8ZXm8gwsnET6MwgeJRq3F23oLZdaSl6FOYufU+BR6DqBXjL9WecZ0NO+x1TomnZrgCT/0u3NB2Y8MhUPqArwyQhVkaFr379OMu7fzfIhHkeyxdOpyGpeKroujaVI5S2T7/Xuy9nMko0yp/a1xm3yhvZcpOoun+shEpyjWVwjoN6hM2qmHw0B/3C1Y/IysaHQiBleZZZnYL/+H3yJ3Kn2ar3As+youH5i0qxU/Hkh8by168hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iWL2EUwUpDDPxZxHx0x/vjOZIshZIA6OpLIvaoqpqw=;
 b=ZU44du+AyBefM2tR/UMqIrz2bwj1abWuuO+VMoofYgFnkvZrvhqIuKD7iltQPsuxw3i/60AxswauiD5u+M3qgQF0s6oP0X8Ul3B6JFDA8JBsoXBH4sHYxjzUsTzrLWmyQSOyWsV3+kxP3VZQjXsokuLssr+Kcegm/8esqHksbV8=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2952.namprd12.prod.outlook.com (2603:10b6:a03:13b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 14:07:40 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4173.033; Fri, 4 Jun 2021
 14:07:40 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, 
 Matt Turner <mattst88@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, Richard
 Henderson <rth@twiddle.net>, "kexec@lists.infradead.org"
 <kexec@lists.infradead.org>, "linux-alpha@vger.kernel.org"
 <linux-alpha@vger.kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-ia64@vger.kernel.org"
 <linux-ia64@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org"
 <linux-m68k@lists.linux-m68k.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v2 3/9] arc: remove support for DISCONTIGMEM
Thread-Topic: [PATCH v2 3/9] arc: remove support for DISCONTIGMEM
Thread-Index: AQHXWQ3S63f+nukXKkSTjzTrbs0oKKsD49kA
Date: Fri, 4 Jun 2021 14:07:39 +0000
Message-ID: <f1616f95-f99c-c387-4ed4-88961457a7c6@synopsys.com>
References: <20210604064916.26580-1-rppt@kernel.org>
 <20210604064916.26580-4-rppt@kernel.org>
In-Reply-To: <20210604064916.26580-4-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec9aea38-5ce5-496c-6277-08d927621d4f
x-ms-traffictypediagnostic: BYAPR12MB2952:
x-microsoft-antispam-prvs: <BYAPR12MB29522BC568D1FC8DB1E567D1B63B9@BYAPR12MB2952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kLGKfeIgCWSG658DWPO+RXBE8ujEWs7JhD7enmZOZPb4UnkNkXvgHmfbArkDNFWJ3EAQ2xskpJ0QuMNxLhQARdSRzoZxsZrCYChc1gvkWIKRIAD+ZHYrkOUumU1MoGkcWxW89wTEXcJcCbBBN202Z6FM0aEBYVWqaGlZ2jFxiVovufvjdF0rqLsyyMX8F7d3vPfFCwDvQMKSBifW3SojFdInPrmO4cEmuAV5Oo6Iw6kxJ4xQvt+4jY0eAxHyt2L4iT33J8vLDwOXDG20YrTIUCDz08LJtClL3vrFT+R2CXz6C+EkOswrccotla1X+QjiHxIdaZOw3gmnq4k25aVQDaOwaY9SxsvJWq8EwCyvcrDjz/m6ncGyLv2gnkt4290OpMm7z4aXoLewFYE2eklVGrrnlXZFiQ5U6sGSCiJTyr6oDFRGg7igaon14aqliBLHDnBg42kOKo3F15VRREYFClk33I9wc8gx7JIB54QCO1GvascoscVou7hc52gFg8SHZOyJ+yIQeNFIkW3BAsLIehO7pKY6eOLvMMZLec+AWe5Q0EZpPAjuhpeQqHtZOZ5IUGAKSTcgq/D9rJPJvDo+g6JXnibZzL2gXw/O2euDkEiyda0UYIUcYNElHP6NaEj2R2dp70agPnZsUvvZ7so3imkSnxOyWLj196l481mugvFl6WvVwuRD7aBculrGmZCfgYvwRgB3LQdBJtNW1ive4nxTrzyzt5Yl8XiySrOEZf/hcKUNyDhxbD8gBUP/U8it/ecRTJ0MPpQDtT0cQEmXMeP02jJEwogUXJ2gg+Eylwfu3YUYpicRtbEZQIYvUzP2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(396003)(376002)(346002)(136003)(31696002)(31686004)(7416002)(86362001)(2616005)(4326008)(8936002)(8676002)(186003)(26005)(478600001)(6506007)(53546011)(71200400001)(122000001)(76116006)(6512007)(38100700002)(6486002)(66946007)(316002)(66446008)(5660300002)(83380400001)(2906002)(54906003)(64756008)(66556008)(66476007)(36756003)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V2ptQUlwVGViWUcvZjBLdXc2aGo4TUxWMm1CWTA5T0dOQTJ6VmxkRUYyc094?=
 =?utf-8?B?ZjBSSDA4UUpMaUlGVDdPZktFVjRZRW9mUFdCeUtXb3lUY0ZobFhRWU9RanVI?=
 =?utf-8?B?NlVMSjFiMFVLOEJjeGU1aS9DOFBudXBxV0ZTeFVLMVoycTNZQm1NdllWOUlV?=
 =?utf-8?B?c3o0WlMyMnFYc3RiZm9oOTlIVVZNR25NaGx1M1VaWUFaK3U0RXlWYkFBclI4?=
 =?utf-8?B?NEMvWWFzaGNMWHVmYVBqM1FOclJ0bTF5aFdRKzdoemdQN0p1b3FGQXBybGZ5?=
 =?utf-8?B?cXFMNGJCUmxTc2FIMGRsRGo5S1VOZU1SU2Z6ZzZNd2I5dTdOQnAyYnh1WUgr?=
 =?utf-8?B?RjFnZ2d6bS9aRHNjWE9lTjhjV0N3V0YyUktGdHRTZzkyWnNhVUVPdFNCYlhO?=
 =?utf-8?B?OUkvYmRKQzJyYVpQZDhmQ05uNHIwM29Ob0d1QTJnUVQ0ekMyeFlGeUpFN0pC?=
 =?utf-8?B?YVZVOU9TWkkwRllwSGR0UEV5ei95UTJlQmpCY0JTcWNidHZBQ0gyLzExM2ZY?=
 =?utf-8?B?Slkvc0xtQmxwajRzWEJtWEVodG9nTk9zYjkxZEZVYkNiakpjd2U4TTcwZkY1?=
 =?utf-8?B?UHBaaHhJUjR2ZUZDZ3ZBTm9hc292UG96dXNNZGJKeHNhcnpUZURCaGVQa1R0?=
 =?utf-8?B?dC9hOFJsTk9tMTBzSCtuazRFUEI5VUFBaFJ5UjNaSkRXREliU2VnWlpyd2ZS?=
 =?utf-8?B?VFJ3Z2g3SVBKZ3hOSDNhdVlWNU9QRHArNWF6RTZzbkJFOE84eExJRmFRS2Rk?=
 =?utf-8?B?OWFtVENZTVp0K25ycE93RE96b2QyVTBpanY3NC9sQUlZVUs1Smk1dTkzSXhY?=
 =?utf-8?B?bmFTYjJtbWxseWFldVBuTnhHOC9YTGZhRFUxRVhqZzU4bHZWVGYwR2lmMW4w?=
 =?utf-8?B?RWpOWitBSlpQQVlYWHJEOEh0NEFmdnhrMTlLdUoxY01YalBIK0RnQ3dEU3dp?=
 =?utf-8?B?SVJ2NE5yTXVOY2poTGJWRkZoZkJpNlNWY3ZuZkhUc0wrOXFsSkxVd08xMDBM?=
 =?utf-8?B?aUhNWHZncUJ5cXhoMXZkUUM3L25xMHNRMlJPQzZscHFMRHJ6Y2M5UEpob1U4?=
 =?utf-8?B?R0FDeHl3MkNOTFhTMi9rVGE5bXBrTHlocXZ6dDViRE9kMkU4bHQwTG5NZ0kz?=
 =?utf-8?B?Njc3ckZYNWUzNVVTczFlZXlkS1Ezb3NON2libklGWXBoTnFVdGxQK2dlRzl0?=
 =?utf-8?B?RzVuc09ocWhGczVmNmZKd1RETmRJZHRoZ3o4UlhPckFUalBRVFJ3eTBUUEVK?=
 =?utf-8?B?UkVockgveHlhNjZ2WnFrVzl2N3FxT2hlb28xcVJCOUl2UVN1dTVuNCtibDVm?=
 =?utf-8?B?dVdIblZiaWZZOG41WHlMWWF2VXNlZHN2M2tHL1dSTVlZc3NWSmFBUHh6Nlk1?=
 =?utf-8?B?by8yMTh5Y29hTkt3MHNWVVJrZ2c5aVJyc1JXZGk3SmFvRUt3alFqaXhrenB6?=
 =?utf-8?B?V3VDVGZkMlhOQ01iQWxwS3Jsbk13YUdScDVMZGFUVERVYnZsRHZkQmcvZDF6?=
 =?utf-8?B?Z0dDZERKUjdQdy9GK281amFVeWlndXE1UktRcUQzM0c1aDFCREU1aklDcEhQ?=
 =?utf-8?B?VjVUb0x6UXErSzNCZ0VwOVRkOVBrSE90bFNhUklMNHU1aDBzVm1Gd3kxV2Fv?=
 =?utf-8?B?REREa09yMWFvWDA0NkhOL0syNVlWeXRxUDZvNzdLQnJMbTVqYmR2RU11ZTM1?=
 =?utf-8?B?Z1BKVFR1ZEFrMEZIWXpoeVYva3N6VUg5Y3JockoxSkVlTlkrUHJDN3BZczdo?=
 =?utf-8?Q?M6izgQBg/bQSkkMM/IT8ZsezvVWgJxoWySEx7iD?=
x-ms-exchange-transport-forked: True
Content-ID: <CFE347B03AED33409071190E62241FD8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9aea38-5ce5-496c-6277-08d927621d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 14:07:40.0286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PrnBrqH3QrBA+OiEtUWfGqfKpkTqnMj72MVfU9v8X0BoGXWJ2Bk846vc+/WCuWvXWSMV28xcZ2P1phTJSwdxnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_070755_759228_7C72484A 
X-CRM114-Status: GOOD (  24.63  )
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

On 6/3/21 11:49 PM, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
>
> Remove the support for DISCONTIGMEM entirely.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Looks non intrusive, but I'd still like to give this a spin on hardware 
- considering highmem on ARC has tendency to go sideways ;-)
Can you please share a branch !

Acked-by: Vineet Gupta <vgupta@synopsys.com>

Thx,
-Vineet

> ---
>   arch/arc/Kconfig              | 13 ------------
>   arch/arc/include/asm/mmzone.h | 40 -----------------------------------
>   arch/arc/mm/init.c            |  8 -------
>   3 files changed, 61 deletions(-)
>   delete mode 100644 arch/arc/include/asm/mmzone.h
>
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 2d98501c0897..d8f51eb8963b 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -62,10 +62,6 @@ config SCHED_OMIT_FRAME_POINTER
>   config GENERIC_CSUM
>   	def_bool y
>   
> -config ARCH_DISCONTIGMEM_ENABLE
> -	def_bool n
> -	depends on BROKEN
> -
>   config ARCH_FLATMEM_ENABLE
>   	def_bool y
>   
> @@ -344,15 +340,6 @@ config ARC_HUGEPAGE_16M
>   
>   endchoice
>   
> -config NODES_SHIFT
> -	int "Maximum NUMA Nodes (as a power of 2)"
> -	default "0" if !DISCONTIGMEM
> -	default "1" if DISCONTIGMEM
> -	depends on NEED_MULTIPLE_NODES
> -	help
> -	  Accessing memory beyond 1GB (with or w/o PAE) requires 2 memory
> -	  zones.
> -
>   config ARC_COMPACT_IRQ_LEVELS
>   	depends on ISA_ARCOMPACT
>   	bool "Setup Timer IRQ as high Priority"
> diff --git a/arch/arc/include/asm/mmzone.h b/arch/arc/include/asm/mmzone.h
> deleted file mode 100644
> index b86b9d1e54dc..000000000000
> --- a/arch/arc/include/asm/mmzone.h
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> - */
> -
> -#ifndef _ASM_ARC_MMZONE_H
> -#define _ASM_ARC_MMZONE_H
> -
> -#ifdef CONFIG_DISCONTIGMEM
> -
> -extern struct pglist_data node_data[];
> -#define NODE_DATA(nid) (&node_data[nid])
> -
> -static inline int pfn_to_nid(unsigned long pfn)
> -{
> -	int is_end_low = 1;
> -
> -	if (IS_ENABLED(CONFIG_ARC_HAS_PAE40))
> -		is_end_low = pfn <= virt_to_pfn(0xFFFFFFFFUL);
> -
> -	/*
> -	 * node 0: lowmem:             0x8000_0000   to 0xFFFF_FFFF
> -	 * node 1: HIGHMEM w/o  PAE40: 0x0           to 0x7FFF_FFFF
> -	 *         HIGHMEM with PAE40: 0x1_0000_0000 to ...
> -	 */
> -	if (pfn >= ARCH_PFN_OFFSET && is_end_low)
> -		return 0;
> -
> -	return 1;
> -}
> -
> -static inline int pfn_valid(unsigned long pfn)
> -{
> -	int nid = pfn_to_nid(pfn);
> -
> -	return (pfn <= node_end_pfn(nid));
> -}
> -#endif /* CONFIG_DISCONTIGMEM  */
> -
> -#endif
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index 397a201adfe3..abfeef7bf6f8 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -32,11 +32,6 @@ unsigned long arch_pfn_offset;
>   EXPORT_SYMBOL(arch_pfn_offset);
>   #endif
>   
> -#ifdef CONFIG_DISCONTIGMEM
> -struct pglist_data node_data[MAX_NUMNODES] __read_mostly;
> -EXPORT_SYMBOL(node_data);
> -#endif
> -
>   long __init arc_get_mem_sz(void)
>   {
>   	return low_mem_sz;
> @@ -147,9 +142,6 @@ void __init setup_arch_memory(void)
>   	 * to the hole is freed and ARC specific version of pfn_valid()
>   	 * handles the hole in the memory map.
>   	 */
> -#ifdef CONFIG_DISCONTIGMEM
> -	node_set_online(1);
> -#endif
>   
>   	min_high_pfn = PFN_DOWN(high_mem_start);
>   	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
