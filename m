Return-Path: <SRS0=K3hJ=EQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E72C388F7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Nov 2020 19:33:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 690F420825
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Nov 2020 19:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qBOgPQuP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gMoTwsaz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SjdYXZMN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 690F420825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nBvqhvqqzAi5mgQy4510eRO0yEV35Yee7wRXnx92eMw=; b=qBOgPQuPtyEHiVH42EWkKutg3
	CQQKm0HAsFJnmwsRKaigKByvesNAjN4R/yQBFGYc6jooVxcLSoIE92j0MvBmOFEIielg1BO2ubyZs
	JtIQWQ0p7DcBWRTmX4OGxw1AYEcqQhcBIW8oiI3Wn+apNWh/1WGYDt+yniPPU8+PXjrnJgteTZ8fo
	K9pgasqMXCwk6sDLmG+T6sMCmiSIRZsw8CybK/6PwgsBI0PQAG7xpe0dsrwj8bjYYEn2u7+hjmCCf
	WIkj9JrTj5tKsqSBfAebIf9NiJpKJB73e5JZtC2KHXsq1O+B6jAnbRHu3MqNk0zVHI0YT/lOhpI+u
	UO4kdzmcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcZOE-0001M3-MJ; Tue, 10 Nov 2020 19:33:14 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcZOC-0001Kz-12
 for linux-snps-arc@lists.infradead.org; Tue, 10 Nov 2020 19:33:13 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B9862C00DC;
 Tue, 10 Nov 2020 19:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1605036789; bh=KKDbFoNYyRc2NmRMSbjf5j0UT/VS9qAVcZ8cFo6ssQ4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=gMoTwsaz2dPURCPoF6bSyfxTLqYTqP9EagXigMQ6324OX4II+6ZEEu4SzLtvDREXL
 O6P21SdGgG7MMPUIuL95qu1mHpdGn96Dcniid75OVRxcCS5X3mfLAy+xrAdIozRDeu
 xZLQICRFtGLtVj3MFYiU11gaX5+pL2MSywL2wIZ+Y35lhtfeBTl2WTCFZX0iHYacDZ
 rZT0LBV4+Mc59Em/TEMJSgkfb1XbnuAWz7+1qRZkgOJzAGZLUe1mlgnHHLF4Dhyd3m
 fTHh9irQr4T6GbmrRDZZrQbWL8n+MuEtQ+6gOpya3ti9ksDd617kTKXTL1pWvSSAW2
 SmcgmwdLXTYMw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 8DC61A005E;
 Tue, 10 Nov 2020 19:33:05 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id AAD804004A;
 Tue, 10 Nov 2020 19:33:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="SjdYXZMN";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ6l1dKEKkKOs8TqpkxEgx+LbjjxsuQIXhzLy6ExSAFE5tqoVA7xFVEwOQhj7sf3pQ0XXxJWNAeDIFP40jjadZ2V05gsaKDy+K9TAsGV90kV88bS8Lrwpzt/vEouG6FE2ghempTRnvho+T+dybAA8brOxbViZchwEO4z0s0MwxJpQbtGexLbrYFZp7f+gExPywYBNmNTaMJmCyYW1lNJTwm8LcP4k1tzggSfFHQYy4okA9fcJANVUvwHcnDG1xpYskf9f9B27Mgy83LtRIImWeDd3mzs0KZfEZHt/6KgSUYhI645CIhoK7dwYP7av8JZY5Zq7ib7i+YKImJgONYcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKDbFoNYyRc2NmRMSbjf5j0UT/VS9qAVcZ8cFo6ssQ4=;
 b=G6OzikgU36KERaPav3Z7TPhk0Y962j2c9dzqKJx5o4VJf8DvuxV8/edG4+c1xsPCSoU/4XmJ1Wc63HMD+ZqLGNeq4l7t+UDDtVS+TPQUKBvFYdJPo2ckMvHic2pYdm4Iejbz3y8agwxoGi2swDQXXg6lyzNW6ypMczC2HBgfaHDJMTYjtsxXHItHzJUSrwnxlm78V5TX+2argw3BD/Odm0EPFGv8S6qPB60LYkWSeYWowpQA7MOOEHB0O+pTG69wNOjrGjd3usUosu26EOaQMYfSbZrmd1OSC/VlahZ7DiLSt2D8HZ+TQf+JblFCYsKsWtXG6q5+fyxniYggZPe3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKDbFoNYyRc2NmRMSbjf5j0UT/VS9qAVcZ8cFo6ssQ4=;
 b=SjdYXZMNFv0QTtBBQ7MazRk/gzOlCt029Wv8ZI5D1VjVAY5oDUb3d5veKKOyVv6OHC3daoH47Gb++bnVWNhTxJ4HpTmxaU++rthKlPHFL/47uC0tMJk/ube9jjUlWVGu1bbWoEgqjihCcbbc+/Ax4P0tfSlQy9RpQPEI9hwMpgk=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2901.namprd12.prod.outlook.com (2603:10b6:a03:138::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 19:33:03 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 19:33:02 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Revert "ARC: entry: fix potential EFA clobber when
 TIF_SYSCALL_TRACE"
Thread-Topic: [PATCH] Revert "ARC: entry: fix potential EFA clobber when
 TIF_SYSCALL_TRACE"
Thread-Index: AQHWpoeFs2lAESMsXEi9RfDQ8a2iPKm7qYCAgAEo0wCAAub0AIACKkSA
Date: Tue, 10 Nov 2020 19:33:02 +0000
Message-ID: <bb732e42-c679-eb26-e87c-b00fd12f65d3@synopsys.com>
References: <20201020021957.1260521-1-vgupta@synopsys.com>
 <9cec26bd-6839-b90d-9bda-44936457e883@synopsys.com>
 <20201107141006.GB28983@kroah.com> <20201109102914.GD1238638@kroah.com>
In-Reply-To: <20201109102914.GD1238638@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20cc4ec3-d4ef-400e-0a61-08d885af7099
x-ms-traffictypediagnostic: BYAPR12MB2901:
x-microsoft-antispam-prvs: <BYAPR12MB2901B34EF738B61F761D8914B6E90@BYAPR12MB2901.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mMAZ32z5PJOxHQeCywgF7xSnfYqdc7t2usSsMPIZOlVivP7pPoaYVUIg2nOwRsZtuymOl8VQ4P6wLdV3O5/F56m0OwIPJx/r9oYLAL8l/d2i7SgXrJdo/zsI9CJF58AKCm2xD1iA8yA8WaRvlHSC3V1VFoIRnf8FUXXPvr/44CTLuLGdUttRLJo6Rh8qAHAwCjjHn09uqyUniJdyr/hBvF5jkfcsiqFsErnixC6SPlCHJV1ara6QhHsNbVIduY4MP+35PaT9c3DF5kXA4yE1qFrq8VmD9Ve/zCl/AvjXQy9DOS3erFUepqfdYXNcM+2UebbPPMIO84Fzlu4NAqNhy5rdMDsL8ZNU1BUPkuOzVz0E+18QxEsieqaKIGx1gVFf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(6916009)(8676002)(36756003)(76116006)(2906002)(4326008)(186003)(6486002)(54906003)(6506007)(8936002)(53546011)(71200400001)(26005)(31686004)(31696002)(86362001)(498600001)(64756008)(66556008)(66946007)(66446008)(66476007)(6512007)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: GbzlscehQo4s6rqyNAW+ycpWLZx8E71nj4DBmKMhbcN5kIrVRVZj7OROFf3BMZscrGQ44TzkRwKM9yeXzDYq+H5ds0cuLs3U70qRBG7TMSMyoqOtan4usg2O+h4pzndjVJh/CUlpCiEi/PTAhOjuStPKTt3LfTcfsTN8XvLVaXzen+3uOx6XV43LiuUxyzMriGavpgPl5Ym9QEbrc50gjbamN/ektVJpkjHc3OGDXBFv++CSAmyhRmNTd+334lhcaRoG1mhCKOTg6lEh10+ad+5yxVWOsPRPEGZ6xQa0i1pS4CkZXLZUu1v2BTg5CkM8CMnERm3815I0LbCYVRpMNFu1Q2rj+bmTBDd7JGug9D2oZsY4BTcAhlIJzOO4hSR04Cjv8CMBtmh1ZQ1V/YB843pfzyM+q5cL3OA/wOgtOrQDvMLiDJZ+V25Dz4/anflFhupthokNYCEuNVSA6OVNhfWIu7J8BO5H8G3YDQFOF3x6QJ69UH8iNS/2nLrdtHsqjMa6wSCtni1bIPK7fNLZlqgp6hsNJO0Ix0dyUH/fnuxUMyiwC1ihWi+RRPeV0D8x/c0KTfVUEecMjNx5G2ppdPRQEwsQjgtGZD7S+2zVAREE3MgmsAcSu48RUqfCYs1tsCdeBlKickqarzDC7iT4tg==
x-ms-exchange-transport-forked: True
Content-ID: <A949D3CD6BA3F144AC5BD65215D1BD16@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20cc4ec3-d4ef-400e-0a61-08d885af7099
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2020 19:33:02.4855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7c8Hj2SVESIHK304+MOjCRLfAqyDgNqZXntQJS5+IeFokijSJK6iGdadTUfsCj0IO0hghPKSieEFrRNNRZ+aPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_143312_535567_87802341 
X-CRM114-Status: GOOD (  19.22  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Waldemar Brodkorb <wbx@uclibc-ng.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/9/20 2:29 AM, Greg Kroah-Hartman wrote:
> On Sat, Nov 07, 2020 at 03:10:06PM +0100, Greg Kroah-Hartman wrote:
>> On Fri, Nov 06, 2020 at 08:27:44PM +0000, Vineet Gupta wrote:
>>> Hi Stable Team,
>>>
>>> On 10/19/20 7:19 PM, Vineet Gupta wrote:
>>>> This reverts commit 00fdec98d9881bf5173af09aebd353ab3b9ac729.
>>>> (but only from 5.2 and prior kernels)
>>>>
>>>> The original commit was a preventive fix based on code-review and was
>>>> auto-picked for stable back-port (for better or worse).
>>>> It was OK for v5.3+ kernels, but turned up needing an implicit change
>>>> 68e5c6f073bcf70 "(ARC: entry: EV_Trap expects r10 (vs. r9) to have
>>>>   exception cause)" merged in v5.3 which itself was not backported.
>>>> So to summarize the stable backport of this patch for v5.2 and prior
>>>> kernels is busted and it won't boot.
>>>>
>>>> The obvious solution is backport 68e5c6f073bcf70 but that is a pain as
>>>> it doesn't revert cleanly and each of affected kernels (so far v4.19,
>>>> v4.14, v4.9, v4.4) needs a slightly different massaged varaint.
>>>> So the easier fix is to simply revert the backport from 5.2 and prior.
>>>> The issue was not a big deal as it would cause strace to sporadically
>>>> not work correctly.
>>>>
>>>> Waldemar Brodkorb first reported this when running ARC uClibc regressions
>>>> on latest stable kernels (with offending backport). Once he bisected it,
>>>> the analysis was trivial, so thx to him for this.
>>>>
>>>> Reported-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
>>>> Bisected-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
>>>> Cc: stable <stable@vger.kernel.org> # 5.2 and prior
>>>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>>> Can this revert be please applied to 4.19 and older kernels for the next cycle.
>>>
>>> Or is there is a procedural issue given this revert is not in mainline. I've
>>> described the issue in detail above so if there's a better/desirable way of
>>> reverting it from backports, please let me know.
>> THis is fine, sorry, it's just in a backlog of lots of stable patches...
>>
>> We will get to it soon.
> Now queued up, thanks.

Thx a bunch Greg.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
