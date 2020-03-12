Return-Path: <SRS0=RZv2=45=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3525BC10DCE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 16:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F51206F1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 16:08:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O54T9e7o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ajGbomre";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dqFBWI56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9F51206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzxU/WnByK1R1Kq7TdSu+qFDaanbgQFGzbpt7z/+jvg=; b=O54T9e7oNUu9J5
	Cn3q6m/H6m+JREZ6es8sLGCKE+KqmOUD+z8tBocbSlH/amAsPPG8pNXK0D81fSrVrpcL2gCnjdnCZ
	w9YuH/g7xmA41+7+GThKGLl1BYO/TEUMMrlwy8O4XUKiyfWTE5rnyokDr0So0OKhmgfzXr++wa00t
	V8Fe4wFlotfTl3NzpYoOG/lGNerHlvCSBPilR7IExTKus94AWBw78pZwBHPwmyo60vRuIjCUyZXDX
	YHoWJQKxsSt/ABw77k+tp2ZJ7FsU5ugF706xQ1bLg60m4llDNfG/+zVCLtFo0tjBDMAeTLO3PxSiQ
	X3T0lJzZKFJs4VuTeRaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCQNN-0001v8-SR; Thu, 12 Mar 2020 16:08:01 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCQNL-0001ul-Cz
 for linux-snps-arc@lists.infradead.org; Thu, 12 Mar 2020 16:08:00 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3E66240697;
 Thu, 12 Mar 2020 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584029278; bh=1YpsBsUBOImA7DsJqMzFf+BwVqb3iWIQDeqx3sMeIb0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ajGbomre4bfNDkWWrbTBiEPqxBOpBjNaOBuUFBU+mKWLSJyOEyZe+MvASASK1lY/U
 X+9yBNPri1KzcjBELrRuHgB/CRKojrIZ+ynhoZKM4i+W3n70Se4S3sKjqSWDwNjE0D
 JIlD7KfnMwIyC0mneT1T+xrFC+wuhaw3ZklFEvWhUwMaoLGXHQJSTdKjrY9y8UOYds
 AgZZUpPAQ+W9ombxllW6YZKDaJhD6u79BdH3fFvJO3ZfmWcKURMOxYrzVBDLLFTFLb
 +IDqrFl22Sa0G2Xj0PoVNNQ7LMlrS/Y4FGzqeB7FTeOK5WnogQAUDO4OdmMxNSvBeX
 wf5jnABRsdGTQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2707AA0083;
 Thu, 12 Mar 2020 16:07:56 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Mar 2020 09:07:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Mar 2020 09:07:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fT6g/Tikvg4B88UNO3LT6BJSgG+pXj76l1woZxi0Rw09aB5nEIOwqvbL0Lb3DS0vK35Bmjt2TVfNdNn8nXMH14oGHH4K5418Dy+9+DTnmk2p6hz6u4S088y1woUOi8XDJahNpm0BgRe0mnh5xcSQGRThNgeThZSWj3Ha4OECW4Jdr+OGNHUE/PMd36g4i7Bz2M5oGo7urOpLb373TIhw1XAq4KjAeWq0KEPeseyyxdYyfHjfH5szdaXZZK0rrDLAxlInLQvl4mOGBSSLHm5XSd+aQIL8l/OMhzYlNEp3FpS/ZYmDFxsZ8aFI9QOCpwmCnlKz5zag39Rpf3ruOPdapQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YpsBsUBOImA7DsJqMzFf+BwVqb3iWIQDeqx3sMeIb0=;
 b=nWBZmcMUahjbbOKgC9qHDmM1KDjFpKVdpIw2VOGzInSK0ia4AEz+ZPtzl+V3a179hzhqkh6XD0Df9Nf5QUvhyiWJqQxLSSy5sPZhDTlHbTJ+W564yyl3XvabBbJ3jjOg7HkTbPRoUuhg5h1A/P6cV86FpvgVT1jFPwdnTVpXWVD2+gwnApFCBFEnqCuN1kgMs2DmsUjz0ipqBNImP3ZQ/IELzlNF+uOb2/Fx5YESEa1T+ECI+qwlDupu5XPKvPsoTEONYTiH/b/mlRMg+a2JWEPfEz8wr4kjxplYDtfJP/A5tevmgSxJg1BzleuX92EYcSkxN0lr+qQCJhlaoneIpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YpsBsUBOImA7DsJqMzFf+BwVqb3iWIQDeqx3sMeIb0=;
 b=dqFBWI56LYovAw+WN+JtthKq17KYV8xS1+9HXsuFpRTBHdduD21qjeD+GSKVX+ZtxOZMYZiRPG5Oo+/7k0ZLf8Hf/EU0g9I/g44sS9WYNwvQdp44hNEanY9vtE+VJ5pNvRGSr3G+57DGNSn0K48IPwsqhnIoVtbJYAgYhPgsy98=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB3591.namprd12.prod.outlook.com (2603:10b6:a03:dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Thu, 12 Mar
 2020 16:07:39 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 16:07:39 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Florian Weimer <fw@deneb.enyo.de>, Vineet Gupta via Libc-alpha
 <libc-alpha@sourceware.org>
Subject: Re: [PATCH] Linux: Remove <sys/sysctl.h> and the sysctl function
Thread-Topic: [PATCH] Linux: Remove <sys/sysctl.h> and the sysctl function
Thread-Index: AQHV+Ihai3f365WbG0aeBytBs3zaiQ==
Date: Thu, 12 Mar 2020 16:07:39 +0000
Message-ID: <980fcb0a-1802-c3df-eb78-d862d9a310d8@synopsys.com>
References: <87imjeee7s.fsf@mid.deneb.enyo.de>
 <3d5434be-5d7c-2477-a5a7-5d934b80b3b4@linaro.org>
 <CAKCAbMhS0Hqhk6OaQc3je6sEBb0=z9m=3A2vi4FBXetgLEwfGw@mail.gmail.com>
 <87sgiewxjk.fsf@mid.deneb.enyo.de>
 <CAKCAbMjCZjxOJSGMe2NfQv72enRkTp5Hpq+94WY4Ye+dQh9_4g@mail.gmail.com>
 <CAKCAbMj52PVTepDEqxN2Y7nG8Qi1-9jWXZincrLicamR1emYgA@mail.gmail.com>
 <f874a0f0-5457-a4ae-1e2c-9b2f177cd4c0@gmail.com>
 <8736aevvii.fsf@mid.deneb.enyo.de>
In-Reply-To: <8736aevvii.fsf@mid.deneb.enyo.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e1898fa-6d61-49c2-4a99-08d7c69f7d00
x-ms-traffictypediagnostic: BYAPR12MB3591:
x-microsoft-antispam-prvs: <BYAPR12MB3591C00A4705282CAB94497BB6FD0@BYAPR12MB3591.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(366004)(396003)(136003)(346002)(199004)(8676002)(81156014)(8936002)(36756003)(71200400001)(6506007)(53546011)(66476007)(64756008)(66946007)(76116006)(2906002)(66556008)(86362001)(66446008)(81166006)(186003)(6512007)(478600001)(31696002)(26005)(6486002)(5660300002)(316002)(4326008)(31686004)(2616005)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3591;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PAg7BB8Q768D5imx4luoiW1OdhGjSU1RkqM4RdBl6TdVfXrL//KSig9CTUnxa5TZ28eAlhwRjX9tu5O7pRHGyjfaBZrT/IjwkXovUT2rATzMa/yRIoSecptYNZvyYmXbzxZRdR4ZHAiuEwoE+cvz3etIQw+/qmTCnXrb4jEGOsVK6d/iKzgxJJGF57cyae9Zt66mK0nhccVomxU5thLh27x0DTilSAx8qiE4FymEZraIMP24Mdv1r2S11Pozv2DTWV1b9EfcdE/RAH24BgPBOwc8TIB4ZHssHmVEm7BH7UNv1v0weyGg9ZQxLzSSHTnYoVk3osBwMKozt2mrD9V5UYs5Mr4ZF/QL4vNTaxV8UjpMuGoqgxwx6sOgCxLbV44A1Od/xCsctmBByrTY3tn3RvrOfh27rJa7+XTl1tJrWXlAOSqh+Hy6QVWGn0YtY6R6
x-ms-exchange-antispam-messagedata: RP4vIL8H/f7GCaie7iwYnFIwnccylwpeoK8bh8tNZlDR9brUE6CA1uRSwyRy1p+7IAkaNwW5zEJV+nBiyGNRllE2oLYHFqbVCCOnV7Z6OXK9BhEZ1CCq+Uh4H6702arBIacnps0SUpfSUMDL5eQC7Q==
x-ms-exchange-transport-forked: True
Content-ID: <14B3C072491BE24488854A7B40DBC9FF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1898fa-6d61-49c2-4a99-08d7c69f7d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 16:07:39.3236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sMj4WTJKKBrEHtmff0T0QdxU9mU9gX8TOkiBIj3TxA8SbRCK7smlt60cDjKatdgaXVzwvcvYslpC2yW2WA/IoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3591
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_090759_502794_E7405EBC 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/12/20 1:15 AM, Florian Weimer wrote:
> * Vineet Gupta via Libc-alpha:
> 
>> On 3/11/20 1:19 PM, Zack Weinberg wrote:
>>> So I withdraw my objections to your original patch.  We can always put
>>> sys/sysctl.h back in the future if someone does the work to write the
>>> emulation.
>>
>> My 2 cents. Can we _not_ remove the header per-se. This can certainly cause
>> arbitrary packages to build time fail (vs. runtime failure from sysctl returning
>> -1 or some such). Propagation of such fixes in build systems it may take a while.
>> Consider my personal woe with stime removal in context of Buildroot/busybox.
>> Despite them fixed in busybox not all moving parts are aligned still and we have
>> to carry such patches locally to be able to even build glibc 2.31+ there.
> 
> Why aren't those patches upstream yet?  (I'm not blaming you, I'm just
> trying to understand what is going on.)

Its mostly logistics. The fixes in busybox was done early but there was no release
(atleast not until I last checked) so buildroot couldn't just bump the package
version. One of my colleagues did send the "patches" to fixup buildroot instead
(essentially backport busybox patches in BR itself) and that got stuck in the
machinery due to some other things.

> Are you in a special position becaue you have to use a newer glibc for
> your port, and everybody else using this distribution is sticking with
> an older glibc?

Thats exactly the case here so I'm in a special situation indeed. Upstream BR is
still with 2.30.x and I needed to test glibc 2.31+ for ARC upstreaming.

> glibc's approach to removals is inconsistent at best.  stime was never
> deprecated and removed directly, for example.  There is also the issue
> that configure scripts ignore deprecation warnings, which then can
> lead to build issues later one, something that does not happen with
> removed interfaces (which are obviously not detected by configure
> scripts).
> 
> And specific to sysctl, the removal of the header and function
> actually fixes bugs in a few packages.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
