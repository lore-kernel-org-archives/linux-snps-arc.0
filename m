Return-Path: <SRS0=Ntev=CS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B859CC433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 17:58:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFAC21D46
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2020 17:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mtOaXhUG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QmPgCKTB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YdBoTDuG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECFAC21D46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QrQE0Vw047z6mJQnAydQlix9IVvc8l4E/JIg4OjR7h4=; b=mtOaXhUGUmy7lmyWyePFywCGW
	NKhRCSvPCVTvxkqQNWWdKCM3LPswFOtsVRVQPTqZKMxF3MxIRgiErXb3aZ2VvB4JdOdeeK40CaH9v
	GsIwolW5PPVK77rKSYDoEw4NyCyUsc3mAS4PGcr5i5Yv9+7NcH4XmWq8qxpSKmrAv3BdoqkA5FetK
	zXnPkifs0fiSFFSjIY3MEpU9vCGiRlOWWV2Rm1QK7IcaGa70J5FDrIBVE0dQ+zGR86veoV+lxaq9W
	Vdps1OQ/wgt3EZwLJec7snq/Lwibt0er3j5DbQ3EOyyczmd6FuQuptxrK3+Myfknpl81hydU62RN0
	DFQHVegAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG4My-0006YR-3Z; Wed, 09 Sep 2020 17:58:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG4Mv-0006Xb-H9
 for linux-snps-arc@lists.infradead.org; Wed, 09 Sep 2020 17:58:54 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 39A8CC00F4;
 Wed,  9 Sep 2020 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1599674331; bh=labWFzpduc7336QSJkd9P3HyR+jI/lwjX4IEnhRqaiM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=QmPgCKTB1WsuCmqXkzPs5/SuBcDA6qxyQFva3vya+16c2V1GeJJqaVwnDSBdTS/0s
 7lV2JiglUTNXf3b1Kxl7nW7+b812Co/eDOFXeT1eMEW00nu5yxKxsN9PbI4IOwuoe4
 C1V19WwDxdi71tEacGfY6f+Qk+HaqqsgEJb0QjSRMUu+bQfOKspwFLeXKb/ASPkZCV
 Sd50wY4J0mhg8wHSsij/7b4G2kkG9nuHihbCGBlI+vFfHyZPUUmkxjNoYJsQ9KsKkC
 PNohfqRX8LxN6rGETwMfm/S5rDkjmaAqQ6+tlOrcI4VR92osz+BUNumh9co+is1jQX
 45fXSQnCqmGVQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4A761A0091;
 Wed,  9 Sep 2020 17:58:49 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2048.outbound.protection.outlook.com [104.47.73.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 83CCA4009E;
 Wed,  9 Sep 2020 17:58:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YdBoTDuG";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA5wKMD+GW3FwD9fb8jL4rS0WbfmkqhdTd/9TrosLGacmsqIrcx1XJ/UbrACr8nsUeekQ743p9016gCEOhQOVu2nH+owLwM1Pt1K098VnoQ8iNe6nLPlBC4lSG3yyWo5gsJv3nvVYSDVymg+38shr9WE38OvMI7iNtmafvBMV2EpIxp8einihbFgDy+GVB0u6yY902ekpECxA9X3OHj8ooImitmK6jjmFf9NqkKxDkKzjEjH46C8ZVBu9jL3tB+LF5FiEdOdCTH7yPjbQdUoESAQaDru1Xu2pj7kzmS/l2cqtNus7u0Pk+BkdsrH3cp+7e/4mw8jDL1LxlP0mS+x7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=labWFzpduc7336QSJkd9P3HyR+jI/lwjX4IEnhRqaiM=;
 b=DBv/J5v2enyZWqsOquKuS4UoXZuOPqiBHqqD9wUVK85IFBu7HfXKl87LS5p8LKKhwtLuc4/ZVJuLiChIUqyUQ2utbhmKPo2D1BMsxdSFNLJvz8HCv1d44IQrfq3S/SS1UTJfaSsDGFQln1X27yytdXioxLIlI2BFqj9AdZ9UIxoNs7GtcKPeDR/qKvXfCOUO0m/uXyd13M4jy7GJ0AjUqLKZJP6hZe1bezegIB44Pg4L2fpPFXExnhy9oaGoCdboJWCacUL58X7sKBG9oSlSDrh1KoGtpXpyG/gX+2dfOhgGVeZ6IwASD1Mu8EaH1u+bS/rn+qE7KbeBF/IelISTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=labWFzpduc7336QSJkd9P3HyR+jI/lwjX4IEnhRqaiM=;
 b=YdBoTDuGfc7VgESblk+cEAQH/Qpa1KLQEyh/LIfzSK4rDytJ5uJM1hasHPnTenUYQfzU4y24aIrfF0b8hvB/i+MmTfC+IGvEG8gPzIFB+ncbDeP1G3xSDNwIrvF59Sj/NX3D/dOdjNfx7aDUu5eeB8/jS+yw1jz4bjS9aWPBE10=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:65::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 17:58:45 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::19e1:33b2:5f25:5c5e%5]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 17:58:45 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH] support: user more portable atomic wrappers
Thread-Topic: [PATCH] support: user more portable atomic wrappers
Thread-Index: AQHWhlnVk5cjvn8UyE6JtSKOXaDLlKlgGKb7gACAXQA=
Date: Wed, 9 Sep 2020 17:58:45 +0000
Message-ID: <c6134d47-a6e2-9a7b-939d-2863bd48f368@synopsys.com>
References: <20200909033221.3549140-1-vgupta@synopsys.com>
 <87v9gnb6ck.fsf@oldenburg2.str.redhat.com>
In-Reply-To: <87v9gnb6ck.fsf@oldenburg2.str.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:b9:9593:5cb1:ebc3:8ee9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26f27963-fbb5-459a-c201-08d854e9fee3
x-ms-traffictypediagnostic: BYAPR12MB2712:
x-microsoft-antispam-prvs: <BYAPR12MB2712C8F2B6F61DEE7C305C70B6260@BYAPR12MB2712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FvpJEq0K9FmZWuIDQPhDWPW630ZCjH6BMNPZchAmxfKq/sZTYnC/CbaAalhRLaN3QC6k9B8zPCZVnPAWZt9w+O8UTaAAkbgBfRrRrIJh3GJb7z5gr6Rabpbr7HtYT19Gp9wUr1p7rKMxrRaWmvgVikioyeELVvrT+4ZOXkw7C0n+rfieOTPyB+6LPom7ILiZ7ytJapR4DboZ05oMnmtqRfyzQFm+4U1TVLYvQWHWlItHuWLOu/7EXYusEWitsqB5oZoP/lEAmW92wMMtZbf9zlM3QTbvheAcFV3ixRwBp27+QvPfJGb3GQQ7248lW8PbSiXAqZXR+88l0nvaWJghtYptjgC2WwBxZX2IWdRTaclnbDSrTxlJqOAqubf/MZig
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(396003)(136003)(366004)(31696002)(6506007)(66476007)(66556008)(53546011)(4744005)(64756008)(66946007)(76116006)(5660300002)(4326008)(2906002)(8676002)(54906003)(6916009)(186003)(8936002)(66446008)(478600001)(2616005)(36756003)(316002)(6486002)(6512007)(31686004)(86362001)(71200400001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /lyVT9yXbcMGCZY5hFIbzo4mYXDZ9C/AWo61/rL1VNeq68RuDjyn+V+JwsI+MPPW0TELuBBytFHVUbS3H0Hs0Ga155gezl1tBC689xLTxcVRAOOTACBBxdgqHkap2LyZAFSrCusg9iIZPyr23xUVEKA263CUfmCiXrzLz56wxOF7I2g6gLHBPwHb2dbCNrhpj5hnL5djPXjEhPC/zzTcjX0Ey6APHGwOJzZLwzVYEaa6DDd8fqLBrRH4YhKnc1xOMt24IkXAfELjvm2rRKbYgFcjBxFthG2jlHa6uVaajBKWMw1pMJtKi7i9+Knu/Bzu9Kbf0Jl5hy0deVcHdHeWZvqCb8ComMnEI7+Cn/rqPB1Qfc6hyHyUGPHmgB8GfNJm3rTaYMnu8Q9cD5gdzmP7/XZPYR/tl9mRCQuDKCnst1V0iMCK9imfaIi4o+55ymQ0sNkk51W+SN2dIIm/lkXBI5llpbjmmyHeIgo8LsOixjR7iYKRG3CmkvrNc8Yy6lQuqWCStu5W/gMxIIgGsuXZJkaqKAC9HDV13AT4LmCrlG1CCACQyiOXbLRmnZnJpmc0DIkR0/DwqIfequ5/jv97XlYLexF/+yN+iZ+TfYR079EExP6IIwqx8SitKe3nnA0i//loBCwesuWJ6/9FCQYHKwe4+vBt9VekShryaKQ9eDRFQx6VXVB9ipZFaUplGT5HX2DMBUB4AENlIv3UbYcOcA==
x-ms-exchange-transport-forked: True
Content-ID: <5A23445FEE350D4A8E326C8B4C728682@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f27963-fbb5-459a-c201-08d854e9fee3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 17:58:45.1328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FbqkmRyCSr3eCnM2tYVjtBPivZlMwYq3KJS6jLbudrXXYMnVTJjwROFvlogtp+MYCdJ6lbpnpHmoSH7xEMYe2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_135853_991627_E773EA3F 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/9/20 3:19 AM, Florian Weimer via Libc-alpha wrote:
> * Vineet Gupta via Libc-alpha:
> 
>> This came up in a nascent arc64 port, lacking gcc atomics for now
> 
> Can you please change the GCC port to provide atomics instead?

Sure, they are added now.

> It does not make sense to maintain those atomics in many projects
> separately.

I agree that gcc atomics should be baseline. I would still propose to carry this
patch as it makes code less verbose if nothing else and the wrappers are part of
glibc already.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
