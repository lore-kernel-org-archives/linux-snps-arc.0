Return-Path: <SRS0=G4Cr=5E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9E7C4332E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Mar 2020 21:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7912076E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Mar 2020 21:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PMo5kmwi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gXJiUPEv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IXN6ZcdN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B7912076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUei3cH8pu+agVjMysMH5wZ1kaGfhchQI6yC4RfAYSY=; b=PMo5kmwiXiZLVP
	xNAbH2+EnWouBDs6WMcSDjbZrlf/04tmBIOJ3oDUXILekSVAosoETERKpSCZKAdgIdFIZWoJ5J59O
	RYX8BIfDusUkuzuurbMKjGwfG1upsrKwUe/hHoDteacgAqcbWZoyvM1kpNS0wY6cwFAKyhLik9Dny
	nAF4ooHRZ8dF1VAArXLR8M+DncorSrRb494mK9UhCtyJUh3dtcTvb36qj7qsBMgsi3itj2TsjvMre
	FFIw5zE5etPZewrUyJkY5+QDU5TgNZqPzsYoOmRSCnSxDeHoDv+fa3eO0xLisYux1kewZiYddZas4
	YxD8Qv9T+077Y4Aekp6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF2ev-0003vM-Ei; Thu, 19 Mar 2020 21:24:57 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF2es-0003ur-QU
 for linux-snps-arc@lists.infradead.org; Thu, 19 Mar 2020 21:24:56 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9D2E840518;
 Thu, 19 Mar 2020 21:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584653090; bh=HL2SLMntf7/SXN9spUiNIm4j+cJDDFlNy+tYVlPFero=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=gXJiUPEvXTj/qG4i367w4oJ79jZQ2dsRrwpPGeLxG1FrmrblMQ6FdhsPHXT/fJqyW
 J0j/DPcp7Myaf1qsdXh3dZ1BFD4PhbwROEFyp7vbFUs8JvmFLJzLeGxx5HacyusfRZ
 /2Uh3XSVaPIMWB+cLUNwndnM5fnZ/BvK565XDY5YurZuHj6YZSuPVES13Ie/Enz4jl
 1l67STmn1uwCOStkvoh9uHLgu1KA/QDUhSqvwksygLx6hC9HUrgAnUvTqYeUnyonXi
 yozS/I+odYNhQ6Ltab4KjHiUPB74LqlMwElGAyOGl7FLerABXVJ9u0X3jl3Ok9X0EH
 0NPieAUVYEiTA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 25BE7A0070;
 Thu, 19 Mar 2020 21:24:43 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 19 Mar 2020 14:24:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 19 Mar 2020 14:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eE20+bRqCFwo9OyLSlVbh7xZyckomYIk+DYR+eRvLjkF1fIMlsHgpOt5JPk7dauizk5yAv7ncwNXwPt6La+c9ejafG/1F9xpG6PxXIJ/tYengGzuBkxR9/yxba9Ogsa1+ltW27vt+hzq5lSMRyFdYW8hw4Df/6+fUrUTuNHN2EBWyPF/7vR6svj8RhSz8gJkYZ/Zl0Jw6W1gVyXlroYg0n2s9/AjPGw1bLkiXaOE6OeSUAE/hrr5SrfFlrwFJenYJR+xnGzjDBturF3AUXrbKgsuyebI3gGUC1TTvY2jVXsnzvzQPZzPelB5GQxlTPrv1affIhzZ+6hPTW56sA1Bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HL2SLMntf7/SXN9spUiNIm4j+cJDDFlNy+tYVlPFero=;
 b=aFH5OdC2hx0XPHtG/MkoLNFLM65Q06aLSGOJoHNNnOSoe5VzFoleb7h75GNi63CN2YoY4jA3LHjsGuYSuGd7ChS/94zn6ZhrrYhr/l5Y3MqXMJBVimy/bKtCIj38vdOFGdGePvEfk+fVYb4YfzO0Qq5NsqsIFMuCx3vzoJxxwsaPNQm90lTCVKEUakTYYUQAbnIRPnwNXWivBF4UajKYmmTHW+GZaeAAPjYTfcTQ8p4ocm+jaLoJ2raPmNlSehMQTA2DFwaZoK3loQT223dPP3fFQF+AJdOnxBhDNJrlxMZn4G+eukDDzhcYiHfNjJcrMqeZD0f15CJbaWMNx38hqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HL2SLMntf7/SXN9spUiNIm4j+cJDDFlNy+tYVlPFero=;
 b=IXN6ZcdNssKybzHMwhdxMJpVj6fpbzrS1wedQWo0qHN6SS2P4EQRCW4HtrZqFWalcZkfMlVRNC+KfnQhjrg92xV9SyqJcJKrx/+uPcFsXt65/hQnv+u+VvGRFMCRg9By2R+YG/c3q5NLWwunYBQfFghOL/QCdsYCqoIxH3DXAxI=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3224.namprd12.prod.outlook.com (2603:10b6:a03:137::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Thu, 19 Mar
 2020 21:24:41 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2814.021; Thu, 19 Mar 2020
 21:24:41 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH v3 3/3] sysv: linux: Pass 64-bit version of semctl syscall
Thread-Topic: [PATCH v3 3/3] sysv: linux: Pass 64-bit version of semctl syscall
Thread-Index: AQHV9zwQ8n+kgHWvdEyKdL46eFRF8ahPBqSAgAF0doA=
Date: Thu, 19 Mar 2020 21:24:41 +0000
Message-ID: <bf5ca41a-217a-1fa5-1f23-871d600c7c07@synopsys.com>
References: <20200305012605.26870-1-alistair.francis@wdc.com>
 <20200305012605.26870-4-alistair.francis@wdc.com>
 <69e30ee6-30a4-81d6-141e-1a42f15a5c8e@synopsys.com>
 <CAKmqyKP2qHv4NgbWw0hcxeX1En3AG7asWwFujzqLMp6z0H4ekg@mail.gmail.com>
In-Reply-To: <CAKmqyKP2qHv4NgbWw0hcxeX1En3AG7asWwFujzqLMp6z0H4ekg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [24.7.46.224]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44ac7037-4af7-4f92-7928-08d7cc4beffd
x-ms-traffictypediagnostic: BYAPR12MB3224:
x-microsoft-antispam-prvs: <BYAPR12MB3224FE082D292F5826E06855B6F40@BYAPR12MB3224.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0347410860
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(136003)(376002)(39860400002)(199004)(54906003)(8676002)(8936002)(81156014)(6916009)(6512007)(5660300002)(86362001)(31686004)(478600001)(81166006)(186003)(64756008)(2616005)(66556008)(6486002)(76116006)(2906002)(66446008)(6506007)(53546011)(26005)(4326008)(66946007)(66476007)(71200400001)(31696002)(36756003)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3224;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: muEpQDLk83/V0LKqznCP/TC5fCs10spI/+5mf4t2iIH5cwVotuWAHKhPHC9jeaZKb7Bz5RsqYe2jFVOT5+7PWOOFKnihgA4++LbbC/LwMv7GUVZ+AAmtTDpJeGYRmCPvXZo4RSLgbFwITCVX/xh7hRQdqU/t9gXkGIVXS1Xhetd1OZMLXeIvaCEFjs3GdE5l2TQafySybOa7PKe2yNCk+O5ftkCJwHLHKoZaM0gRS5MQLNKR+eO4iD4cNjYe4LZItyC8wTegDoRDvyOLUGdvG8iI7kvEANd/hhhSq6imwW2Rt+ZO2EYILqvLElswUIX5y64RLOefChqZWOZEr1/mNILXmyFaeL27EGS6drFGFs2WGXS0Ly+N7EdL+rnfzHfABwppwJ7vU5yP80nRq3JfhI4dpzPhZiporkwGlrv+2N2y/iDQqfMEllIcwSofJRL1
x-ms-exchange-antispam-messagedata: ymMaMVBAdbDbfCw1v64cc4uJO45vlJIXQRE35kWZBEPEEnGShwEGCdF8wbaeH2Jp69Oee3Wn2AQGtAmm/0cKS99L175BoRO92lJ1UurnlCbMsG2UvMrUK6HZbNg643kmxB0Hm7sdQX6aFskRma5hiQ==
x-ms-exchange-transport-forked: True
Content-ID: <F852060910750341B0ADD16CD2411812@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ac7037-4af7-4f92-7928-08d7cc4beffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2020 21:24:41.6804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6kcNpuDK+z7uIQWtVQxEEKxe97/cB0MwvW7d5+0uUhqccEtLLAjusNjMB9Qv2LiCxjW5ixyiktWZvd3NeichCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3224
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_142454_934703_B0109261 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/18/20 4:11 PM, Alistair Francis via Libc-alpha wrote:
>>> diff --git a/bits/ipc.h b/bits/ipc.h
>>> index e2981fd5c3..9ac8485193 100644
>>> --- a/bits/ipc.h
>>> +++ b/bits/ipc.h
>>> @@ -29,7 +29,11 @@
>>>  /* Control commands for `msgctl', `semctl', and `shmctl'.  */
>>>  #define IPC_RMID     0               /* remove identifier */
>>>  #define IPC_SET              1               /* set `ipc_perm' options */
>>> -#define IPC_STAT     2               /* get `ipc_perm' options */
>>> +#if __TIMESIZE == 64 && __WORDSIZE == 32
>>> +# define IPC_STAT 0x102     /* Get `ipc_perm' options.  */
>>> +#else
>>> +# define IPC_STAT 2   /* Get `ipc_perm' options.  */
>>> +#endif
>> Why is this needed. Linux kernel seems to be returning EINVAL for this cmd-id and
>> following fail for ARC.
>>
>> FAIL: sysvipc/test-sysvmsg
>> FAIL: sysvipc/test-sysvsem
>> FAIL: sysvipc/test-sysvshm
>>
>> Shouldn't this use the default __IPC_64 value which is 0 not 0x100.
> I think you are right. I have fixed this up in the next version.

Thx, that indeed fixes those tests for me - off of your latest branch.

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
