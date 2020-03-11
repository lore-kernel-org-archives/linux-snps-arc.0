Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44244C0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:14:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C5CA20746
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 22:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u0AAA9oO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Qbg0iPxb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="HwxKVOh2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C5CA20746
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DEIWnPhl3taYtM/inJxfaSAqo13d+96+Z8jjqkq3JQ=; b=u0AAA9oOmITvjz
	Q7hWiK+Gf1KhUxoIUoC6mswjt1cagPNfFFBttjRkxqQUt+8OzwfxKmN1mwEUJpHdzF+g0u6ZP3O1I
	Os5XedjRZNNFvLZqGzOQrVuncljkBIMvs+agt0XbgX5ZGya1ymGnavpB1Bt4YIEnyJIts/ZA9GLOC
	Xo7CFJiB0P9pkLQh/ZIVj0oxQnn6pvZhxnHZ5WcMXDJXWOvZq7iVQPymipxdy8im5o77CrEA1lLWT
	KkR5b6WJ0KXpCf+MCgO+EqFKfvz44uVjsBmxlowcfLJltg2rqCuk2sxjrStaxwnGdDIBNnEYJQh7D
	gbYj+p3DZjxnaj6Jzmxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC9cq-0007sq-4N; Wed, 11 Mar 2020 22:14:52 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC9cn-0007sQ-LK
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 22:14:51 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 88641C0F75;
 Wed, 11 Mar 2020 22:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583964888; bh=yoVSiJXF0VXIkwZsO11vfkXJQHlyL1amJfYyNUjybdg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Qbg0iPxblMZ5uut6R17RYkytPBpS+xW1K4VVSxLN0aROqSs7KYkZrF/kEM+85vYKv
 pZ5eYW3kYwNjC3taVdo5tGW2AniYn9jM5g3NNznQx+qv6XTtowInRgwd2/t7mIo+H+
 Kml5CDcVq4WjjseM9izCKKDyaUgfI5RVXChusQj4vr5XAHNg9ZJypoJ5o0aVKQwf4o
 8rVNvOHBXaSwFDjUjbBYJEluOOOBUTeUEkH+13llQhc7PfTqQtoblyffZf9sljspZh
 Gi47OHWPwreWfbE4iotEuzM0uMgJXzY5TokYKa4vrR2hxh5vYFbJ3DEkyDYBcIfSnf
 PXXvsJ7lthmTw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 01F59A0083;
 Wed, 11 Mar 2020 22:14:47 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 15:14:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 15:14:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjJWRIP24U7WWvDHZDjfDDnil3IY52iXOD6s0LEgylaHaPA0hVOrPE50NQX/awuAzMAzCsfanrw1mqMOSoDelN8J0h9rcFxfJuyrrwA0LOK6f4KgwAHwX9lLMS8MA3EZ7ulnbIZYneqjvrypDuZ0QqPtbeVypLMCP8dzsHa5JQ083I04sB4xs6DMxhURgMT83rwkg+/58XkxJ4StKZrfPeWBFHhV4+3r/0ZD4xehWwmywpaqFM7x3g4lnTEBtU6P11MW8GuJjtqy2O+LYgSuWMjK1rL+YBB9IEsVcC4UOILF/jFgV+Xfy3711QpPO7nqlDPj70AaKZ7gJIKnzymdEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoVSiJXF0VXIkwZsO11vfkXJQHlyL1amJfYyNUjybdg=;
 b=f3w/7Tm3uIp4dFhpnDtPgHxXdC/mxEK5IEW0tiaNtS87Dst64smqSUyqp63yhX4RNgUTaZQZWR+IljWWaUmHZ1DeEQOCqjGW7rOPnjmAfgdOAbMIQILqHu3OXUWBkGxwdMyb/6FZ8KGCC3K0b1nUxaqJKCH+r66onqSGlaLWNVgSF+K96XmdSInHS03RtQU6qmuQ6pt6smFEPsInRoTDcFeNhDgmwB0ceuAfLjKOhII9pwCU6CfY1xs4tArJGvMD3zVqesMahIR2hF1aK1xLKZs2ZrlhAz1zv2fpQQxpMLUYS+AdhI63E87eFD96v3ImAQjQVB3ixGV+TLngcg+tKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoVSiJXF0VXIkwZsO11vfkXJQHlyL1amJfYyNUjybdg=;
 b=HwxKVOh2L12Z//czOslInt0XFOIGyERe+2EWtJTcAILzWC2gkGoUGyrnRvVXKGjMXwUHwrkJrIgmI5SN7Lhy9c6aK+w9kiPYad6T9xeJoq1R28PQ4hLHHCcYGanO9GuzehQlqAyRzWqN85o7OIG9Q15+in72k2JQq0TV5sMenwA=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2949.namprd12.prod.outlook.com (2603:10b6:a03:12f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 22:14:26 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 22:14:26 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: DJ Delorie <dj@redhat.com>
Subject: Re: How to elf/tst-ldconfig-* in cross test setup
Thread-Topic: How to elf/tst-ldconfig-* in cross test setup
Thread-Index: AQHV9/F2mnc/PSViNEiFGKxkVKa41KhD9PiA
Date: Wed, 11 Mar 2020 22:14:26 +0000
Message-ID: <59f54822-4b8e-fefb-045d-cbd447e0e72d@synopsys.com>
References: <1e5222c2-5e79-1cbe-1bc1-ea1c31f920a3@synopsys.com>
 <xnzhcm4kc4.fsf@greed.delorie.com>
In-Reply-To: <xnzhcm4kc4.fsf@greed.delorie.com>
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
x-ms-office365-filtering-correlation-id: a2505c66-277a-4731-b67f-08d7c6098f9d
x-ms-traffictypediagnostic: BYAPR12MB2949:
x-microsoft-antispam-prvs: <BYAPR12MB29490FCC82DC268941B27C86B6FC0@BYAPR12MB2949.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(376002)(136003)(366004)(199004)(6512007)(6486002)(186003)(478600001)(6506007)(53546011)(4326008)(26005)(8676002)(36756003)(316002)(5660300002)(66476007)(2616005)(76116006)(66556008)(66946007)(71200400001)(6916009)(31686004)(54906003)(64756008)(86362001)(81156014)(81166006)(2906002)(31696002)(8936002)(66446008)(47845001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2949;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOILCX7sTxIml/c4AMvZ3tQ3B1NXHe0n5oDHctAAGcKPVqfgDKodpG5ZfyXQfKizwMP6sgfXsU2IA2yjIK3ywZDB+OtY48Enxf3hmiKDK8HOSJQeFuWP7QvGrIU0uei1iwvcUvKTrDjDKGdvc9Jtky1rBB7vIJgo3tw3+LfcM8mqbBcTsfr6wu2yCyG5G5mMnwI0T9890om3wa2/R+D11ni+9k3KqCBEubEAsf5ekW4w29wA6w5byMgXYvn7XF8efDl1I6iLIwF/LS5iXZiednvav9UZ4/s365boM0VEcKNx7piBMGMxuJnpmXU31RChs1ikzVz5XvVPEzJMeCTNXeYMynPY6imo4IWI3XcAYIuU8vLhL0sddLgc94rqFKH9OYkkghajnbfMk1GITKqahJkzSxf32b8SvTyWuGxxuzplQZj6wfnlfItHOjy6InRX5lyMl9EU8mioSwnDo3UItT9R8dDoi6uD04sbYaHjl4y0uRLLO197V6Mq4QiNqXD3
x-ms-exchange-antispam-messagedata: 7pBonpJ0wtLEnjyBZiDRzQ16lbctWlG41ODgdWtc7g7rpnXxEIK0Ak/ElPoJ8aOiD4p8ZgwJ/nHFs+bHkF4zCThqaLRJ9SnTLiy8MtdtWjyEFA8dm/c1hF97UXg1NbsZbpZfj1CqnxrNOrvU6qG+yQ==
x-ms-exchange-transport-forked: True
Content-ID: <C199831ADF11264290080FCDBE2C3B7E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a2505c66-277a-4731-b67f-08d7c6098f9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 22:14:26.1408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pl7vWYfON1UmdfCrDOWUhQjOncWZcLSZpG3S7hx9AqcQeyxsjQmOYCgnjjH09pZxFExP9fcbaOa9/oklQUGR8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2949
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_151449_817136_C11673F3 
X-CRM114-Status: GOOD (  14.53  )
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
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 "ahajkova@redhat.com" <ahajkova@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 3/11/20 3:07 PM, DJ Delorie via Libc-alpha wrote:
> Vineet Gupta <Vineet.Gupta1@synopsys.com> writes:
>> No, I'm running this is a cross-compiled setup where the test artifacts are on a
>> NFS mounted host. Here's the full strace for test
>>
>>
>> $ strace_static -f
>> ~/br/build/glibc-867196a7635/build/elf/tst-ldconfig-ld_so_conf-update
> 
> This is a manual run.  Even with a cross setup, you still run
> test-container on the cross target:

Sorry for derailing you. The strace itself was a manual run to see/show what was
going on - but I forgot that the very act of observing changed the
execution/outcome ;-)

> 
> $ strace_static -f
> ~/br/build/glibc-867196a7635/build/support/test-container \
> ~/br/build/glibc-867196a7635/build/elf/tst-ldconfig-ld_so_conf-update
> 
> The containerized tests are (in this case) containerized because they
> rely on setup files (like /etc/ld.so.conf) inside the container to run
> the test.  Otherwise you end up corrupting the host OS.
> 
> The test infrastructure knows how to run containerized tests on remote
> machines, though... any reason why you're not using that setup?

I was using that setup all along: this was my original host cmdline:

$ make test-wrapper='<full path
to>/br/build/glibc-867196a7635/scripts/cross-test-ssh.sh root@192.168.0.20' xcheck
subdirs=elf


> Note: if containers aren't yet supported on your platform, it's OK to
> just skip those tests.  Also, it's not always a good idea to run a
> containerized test outside the container; the tests assume they can
> trash the container as part of the test.

When you say containers is this linux cgroups or something at a higher level: does
it need any specific distro container package. Please remember this is a
constrained system built off of buildroot.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
