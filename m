Return-Path: <SRS0=IYFD=LE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD78C48BDF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 21:58:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2807C613F1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Jun 2021 21:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2807C613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MH3+weGAnuTiU5dctaefMXCjLzOGDMI0lvB5jj70LWA=; b=JEoQR2NxPNmWNe
	wGEWa8juviXg54RJWquZo3njyr4yz/hdW4dqh0lgkQ/rmBXtPy0Iw2kjielGzHy1UWELfDOvltVMH
	jlada3xXfTMPcC0DUW1Or2IsThWJwrlHPU1YxPDkSAbyWLQ6I1+LbrZpwANFoOll/zBT8bX0CaQUi
	f0icJHQQsl8BYOQK7virsE47P+nFTA1ADbOfMJ7v0YfJcAS96MADnsNp282nxZgjV55cp723sE5xh
	LuLdyxDuV3Q2HspPBNqy/RAhU++MC/aB6jsgEuR5AUpUxSW33JiRU7xJgQQSnym6OVGyYKYz6l+Oq
	vfFT/hw9NjLx3bbsjbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrShU-002gkh-5U; Thu, 10 Jun 2021 21:58:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrSWj-002b9e-4o
 for linux-snps-arc@lists.infradead.org; Thu, 10 Jun 2021 21:47:51 +0000
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1644BC0AE8;
 Thu, 10 Jun 2021 21:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1623361665; bh=kufbqZSwDjZC4MjkxRY0XuA+LVzKuaiuUJSyMR5wDoo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Jhy1M6fKkqCCJpIVJgu490O2cEY+7uuum4A1zroprH+0HZhYF0l5VRN5NRRKYfn6c
 CWY6B1m0ww9zRj6l4fWt/qvFfMchWy5oZsyLIHl2mfQJb++aHX589H+RZuBJoB1zh8
 Ct7gPYb/6qqWL/J1gzD+ab0yqK2SqllEwvv0VHQHKCyO0rdBVGpP7v3hBZyeX1Jo3J
 4Af419xuYU++7awf1vkAkXVM/JLz9Qpz+0abT03mcBOwZqnfhd5VhaSF9/J+A9z1DK
 wzHJeVQ2aGx/C+AB/OzpBsTIUVzFBaL1CuewtmZucXxQjcrG+F+m9wZYqvRiequSAy
 tTScpQ5fU2THw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 849C4A0080;
 Thu, 10 Jun 2021 21:47:40 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 546D9800CE;
 Thu, 10 Jun 2021 21:47:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="w4+2Rq/8";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZjWYeSgrz4Tuy6jc8EC80cS7Tla8IhUo5zAnUOQMlVa3fSIGomB1rM+H1P39vUVQ1M83CJKJVwz0CHW44FBEs8kUu3g33MdOywWSEEjzO7CycjruOEOHGkrn9dJ2ny0kBzmFgBqStdMPZXK4HsccQN8Dssudxw9qwPxmTDp1YEu4KUDZhIMn7HHh9tSW5kr6i/YYnRf7FotupauUeH/ycLh40C6pzfMxLioOVQEm1Na6tMYPPWBFF9+UNjWIbO2/D7KcbX/5arrS/DaH3UK3PkWTvZ/Vn7dQT64Gw5qVbOu1m/H/cYV9Red9uTFTr98o0wMyR/gHN9OZipdBiIxmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdulVwtonYO1jc9oDbu4UWSQE+Y5Nbm8wv1G6n6cSSs=;
 b=mBZcoxJYuXr60BKDyjkmF5/q/7yJATawdSywv47pLzUPWAyTNoIatHhNqVLqJOcjc8Odw/2y0IS+8COaWLEPyUDVgDgDqOCXzPk20K0Tgjahi0UbOmk5nSJXYdGpsVUDhYv6uZqOpku+ljH7y8KVtxyfgw6bFbMLRvysC1BWXQAGbKfNk1JssHy1b11+1ZtPY4ACz3OrDZZmplQH2F7JGgHi/4yZBFsKHvMh+sZDQD4/gd+hANphh3JK1p0ARdrsF3AMYedbDiq/0UwMk9BCbE2iEyArvKmoWhn3FV+kye2tV5EqQRU6Q5/V/EcMkvt5qG4FWPWuzeLNa16aoVrExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdulVwtonYO1jc9oDbu4UWSQE+Y5Nbm8wv1G6n6cSSs=;
 b=w4+2Rq/8vAbUbO3GRL42DELWNC3CpPR5bXctZ/mFpNd5TrKF5fOjd6JrEwUwwCrjW22f0cb08KJN2ftD4PjOVwt6oJ5dlwtdeLVkmr1N9HHJnAy9t8gJ0TCCvWu4hkMVRwDI4IUlryNnl/Fi8JaY0YnfZzCRg1CLNGZ5N0JrSTU=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4855.namprd12.prod.outlook.com (2603:10b6:a03:1dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 21:47:36 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::d1a0:ed05:b9cc:e94d%7]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 21:47:36 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: kernel test robot <lkp@intel.com>
CC: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, Linux Memory
 Management List <linux-mm@kvack.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
Subject: Re: [linux-next:master 8465/8758] arch/arc/kernel/signal.c:101:21:
 error: 'struct pt_regs' has no member named 'r30'; did you mean 'r10'?
Thread-Topic: [linux-next:master 8465/8758] arch/arc/kernel/signal.c:101:21:
 error: 'struct pt_regs' has no member named 'r30'; did you mean 'r10'?
Thread-Index: AQHXXkDT90tB/Nq910ae594n3TMmxKsNx/CA
Date: Thu, 10 Jun 2021 21:47:36 +0000
Message-ID: <cc2f27d3-b747-6c00-cbda-45489a9461dc@synopsys.com>
References: <202106110553.xB3f0eCM-lkp@intel.com>
In-Reply-To: <202106110553.xB3f0eCM-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b59053d9-d579-4bae-4939-08d92c595c78
x-ms-traffictypediagnostic: BY5PR12MB4855:
x-microsoft-antispam-prvs: <BY5PR12MB4855C5E24F6744D58401B048B6359@BY5PR12MB4855.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:23;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7RP+baTVjeG8n8b/25hoDRHsst3+xdHNaSE8wGzCsJPXPxm8kJbi/M0nEN0BrSBmdrFyLzmFt4Mrc2Z8DgVofUURDRxzWY80Pg8JL1Z/MvcBVEzwlxG12zBKSaCJrje1pOBgn9+R5Hxazyz1QOeILDKKJ77F7KtCU5P6k3dK9CcV6DrwNmuy62QN9VPSKLGt3mV5z36Svxi2ZOysVvk/btdGp9Q5eXSMM/vi/5mcnMDDT54IQOxQpJo6lk1ioGhwamZwaUXDRCiqaRGodHLV0Di+NpN3sBnhM7oJVz0EKEuzcoNsyFxl87uE0oPr6wZUyq8hdZgooAlZpq2Cg5hchwfg8GqeF3ErG2DaJHs5IoAkQcl5pMIyQvqQtm/g02C4D0s8ZdDqFZhSq0i3m9cwLBGfdNjsrZqy9HITvNshFZvQ0a2z3MSa+KxG5OW253/D1IZHQM9yeG/ozjsN4VkQoGOf2h8tcgsK+xzz/L89dfBxoesISsxAAQAJLGdfb2qwJU3n7CG4dGftRsB7GNSBt182r/tyajaH5f3eBP6gGdY//AM/qyCP88a+M+vaQ6Mku77DskzTl/pUNTFLfTzybyfs7A4/fFDveEAj+RNm6YSRctPDFIPM8/WOi54/Eg7oFFAM9PcgOT45ShcgQgQ95t/Eeo5QMkgg4lCbDCyg0Fj/OXfdsnkz/icnwKqP6lo1NM8gmJlKg84u7cwK6TO0k5riUdYPG5n6oKUen8vDs0dwRud2OCwzEsZWjqaMQbAcNpyXALVFcxDJwCzVCgnXsSvQz3llrEqysDDVCNjz/EPUryROFSv2SIuMk1CDUIcp5XNY4QN0i5lgm6Jq7mBkugx4Ey+FG6MXbwu1xzVw8cA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(346002)(376002)(396003)(38100700002)(66446008)(26005)(6486002)(8936002)(6506007)(53546011)(5660300002)(54906003)(122000001)(2906002)(66946007)(66556008)(64756008)(66476007)(36756003)(186003)(6916009)(6512007)(31686004)(4326008)(966005)(2616005)(316002)(71200400001)(478600001)(86362001)(76116006)(8676002)(83380400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?6HYr5OuTWc0uPIhqQ6dEk1SBcxb8403xmPksAtFckQg5yM4iwkqwQ2OU?=
 =?Windows-1252?Q?QKtz5ci8ZamTAVq8rmdFGPgTc4dCokl/CBY/hRM+6jjtw8ZZr3aadG28?=
 =?Windows-1252?Q?SfJZ66VsLaEZ1HoMAAQvV3Cg2QJPqdLvSRwjk3a6kgI1mcm2thBtpnPm?=
 =?Windows-1252?Q?d5GQ6I40TGAT4YoZ9G0QeM3iUR5FnXV8pSFnIGd6S+sbDFD291jZ5PRR?=
 =?Windows-1252?Q?U0sIWLuNzXbcwh3Vonb0qYGUujPoOBdR8DW7llD1PEg2biwz8ApfKNlA?=
 =?Windows-1252?Q?ZkQP+BPTApRh7PLfnizLKmDTVZvvHLR8pMZau6qgjT1UVztRc0lL2z11?=
 =?Windows-1252?Q?+/JW6t24TmKKsn/nDPxwk/PGJT1KwLQr1ZUYoiWSqFDpglWBQiVmhMU3?=
 =?Windows-1252?Q?4ZoUHBL1mCUYdb/uAnlmQgGsSfKFbY2OzA/gSGabJmtcgJzUvDtvH9cF?=
 =?Windows-1252?Q?yoT0OinnxbJQyRBbWAh+lT78hfWXVoDOjdDib8yLxLhrAf0Z+3xDw27M?=
 =?Windows-1252?Q?rsyaGoK+9mx49hSPM4/ckaY6Bg41Hcw4jvUzNRDqXgDE5G6Gj5QykOSQ?=
 =?Windows-1252?Q?yvimic5G/xCTxiJe+YKfOloP41nGCGYXb1V6CZ4xJzbsu800XQgBAnF3?=
 =?Windows-1252?Q?N6merfprkRf+Iaiynxmv4SgQOWQQQSRAR1l2AXYDd2mliPi4yOM5iBPm?=
 =?Windows-1252?Q?Z9d0iXEnSOjNgUy9iONN4bED3jhFN7KuLZ3xyrItN/hDuijII1NX1NhD?=
 =?Windows-1252?Q?RIs567p2vA2aej4HhEE7WHs3HtfYznQDsP6RBqJMS11xSBhpXUjpFQFr?=
 =?Windows-1252?Q?0Mal3w2vIPJsMsmonH9qm6nqPu2ph/Y+kX26XIyOFk78kbJ5MUUXsoEg?=
 =?Windows-1252?Q?kqbpgNrT/HO7eS2C4n/PP4LH+ByZe0DKh2pSMHgmxl1R+DPd2biqSr57?=
 =?Windows-1252?Q?aJ/rD2o0O01M7Gvr20pwmFnWXpu/YiEgpWnM7z3QxDqFY++lsTJ9YlkJ?=
 =?Windows-1252?Q?gYLpz13qGqcCjH4ADqfUsnutKVUD0AFYRWLcxyajnXXVQvB4lVC7YIWI?=
 =?Windows-1252?Q?onxTldMFBv9wodUE3auNrl7Oy3WAVMVyJheM+rcH3KT+5rvFwvxs/Vb+?=
 =?Windows-1252?Q?GElYnPqpZlqa9gOS8xn4wzrr2JFOmBFxvn99C1VnxF8cxGJ19zXw8H5N?=
 =?Windows-1252?Q?h90+XXp5buFRP0McaoM79/XXQ23dQu/K9qPXUIFacLsiXuUBgpwJJdec?=
 =?Windows-1252?Q?nxKGh0zuJHVpKw6Iuvc+7gO2YD76++RJ8Az7Kr///pIYPWctz/m3nU2B?=
 =?Windows-1252?Q?yW+qWP8V3QDbUFvtUmTdwhJVKtBvHDpZBavzQTUG1ssWdOngYx4rwERq?=
 =?Windows-1252?Q?JMcFyI1OI5cUsn5LydMp5tc/EZ/EkVxjpus=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <A9AA0D64D3C345409253D912F0833638@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59053d9-d579-4bae-4939-08d92c595c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 21:47:36.2625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QwgruI/ebcJHsVrXE5psFNOs9mWxVXXO/yqDRbplKFV1nYVpC1UA25BCgNWafgm013KZvnxtkf75CcgaZA1MDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_144749_386144_F8F517D3 
X-CRM114-Status: GOOD (  19.20  )
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

On 6/10/21 2:36 PM, kernel test robot wrote:
> Hi Vineet,
>
> FYI, the error/warning still remains.

I posted the v2 patch but didn't yet push my branch. Now done.

Thx,
-Vineet

>
> tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git__;!!A4F2R9G_pg!OKqfde4ua3ZrR7XYJtEqASSTLKtjW1iEEeBD5V38iLgNZ9l3CBkaluPc9FDW_E5l$  master
> head:   50a1180e6cf12462bbbf3f2ebc5b93094ed9abee
> commit: 98ec2edf58c820ef953fbdfcf98d706aa804b822 [8465/8758] ARCv2: save ABI registers across signal handling
> config: arc-randconfig-r001-20210610 (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!A4F2R9G_pg!OKqfde4ua3ZrR7XYJtEqASSTLKtjW1iEEeBD5V38iLgNZ9l3CBkaluPc9Cao0rHM$  -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=98ec2edf58c820ef953fbdfcf98d706aa804b822__;!!A4F2R9G_pg!OKqfde4ua3ZrR7XYJtEqASSTLKtjW1iEEeBD5V38iLgNZ9l3CBkaluPc9J7KfXQN$
>          git remote add linux-next https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git__;!!A4F2R9G_pg!OKqfde4ua3ZrR7XYJtEqASSTLKtjW1iEEeBD5V38iLgNZ9l3CBkaluPc9FDW_E5l$
>          git fetch --no-tags linux-next master
>          git checkout 98ec2edf58c820ef953fbdfcf98d706aa804b822
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     arch/arc/kernel/signal.c: In function 'stash_usr_regs':
>>> arch/arc/kernel/signal.c:101:21: error: 'struct pt_regs' has no member named 'r30'; did you mean 'r10'?
>       101 |   v2abi.r30 = regs->r30;
>           |                     ^~~
>           |                     r10
>     arch/arc/kernel/signal.c: In function 'restore_usr_regs':
>     arch/arc/kernel/signal.c:134:9: error: 'struct pt_regs' has no member named 'r30'; did you mean 'r10'?
>       134 |   regs->r30 = v2abi.r30;
>           |         ^~~
>           |         r10
>     arch/arc/kernel/signal.c: At top level:
>     arch/arc/kernel/signal.c:387:6: warning: no previous prototype for 'do_signal' [-Wmissing-prototypes]
>       387 | void do_signal(struct pt_regs *regs)
>           |      ^~~~~~~~~
>     arch/arc/kernel/signal.c:420:6: warning: no previous prototype for 'do_notify_resume' [-Wmissing-prototypes]
>       420 | void do_notify_resume(struct pt_regs *regs)
>           |      ^~~~~~~~~~~~~~~~
>
>
> vim +101 arch/arc/kernel/signal.c
>
>      63	
>      64	static int
>      65	stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
>      66		       sigset_t *set)
>      67	{
>      68		int err;
>      69		struct user_regs_struct uregs;
>      70	
>      71		uregs.scratch.bta	= regs->bta;
>      72		uregs.scratch.lp_start	= regs->lp_start;
>      73		uregs.scratch.lp_end	= regs->lp_end;
>      74		uregs.scratch.lp_count	= regs->lp_count;
>      75		uregs.scratch.status32	= regs->status32;
>      76		uregs.scratch.ret	= regs->ret;
>      77		uregs.scratch.blink	= regs->blink;
>      78		uregs.scratch.fp	= regs->fp;
>      79		uregs.scratch.gp	= regs->r26;
>      80		uregs.scratch.r12	= regs->r12;
>      81		uregs.scratch.r11	= regs->r11;
>      82		uregs.scratch.r10	= regs->r10;
>      83		uregs.scratch.r9	= regs->r9;
>      84		uregs.scratch.r8	= regs->r8;
>      85		uregs.scratch.r7	= regs->r7;
>      86		uregs.scratch.r6	= regs->r6;
>      87		uregs.scratch.r5	= regs->r5;
>      88		uregs.scratch.r4	= regs->r4;
>      89		uregs.scratch.r3	= regs->r3;
>      90		uregs.scratch.r2	= regs->r2;
>      91		uregs.scratch.r1	= regs->r1;
>      92		uregs.scratch.r0	= regs->r0;
>      93		uregs.scratch.sp	= regs->sp;
>      94	
>      95		err = __copy_to_user(&(sf->uc.uc_mcontext.regs.scratch), &uregs.scratch,
>      96				     sizeof(sf->uc.uc_mcontext.regs.scratch));
>      97	
>      98		if (is_isa_arcv2()) {
>      99			struct user_regs_arcv2 v2abi;
>     100	
>   > 101			v2abi.r30 = regs->r30;
>     102	#ifdef CONFIG_ARC_HAS_ACCL_REGS
>     103			v2abi.r58 = regs->r58;
>     104			v2abi.r59 = regs->r59;
>     105	#else
>     106			v2abi.r58 = v2abi.r59 = 0;
>     107	#endif
>     108			err |= __copy_to_user(&(sf->uc.uc_mcontext.v2abi), &v2abi,
>     109					      sizeof(sf->uc.uc_mcontext.v2abi));
>     110		}
>     111	
>     112		err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(sigset_t));
>     113	
>     114		return err ? -EFAULT : 0;
>     115	}
>     116	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://urldefense.com/v3/__https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org__;!!A4F2R9G_pg!OKqfde4ua3ZrR7XYJtEqASSTLKtjW1iEEeBD5V38iLgNZ9l3CBkaluPc9LGECAK4$


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
