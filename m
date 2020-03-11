Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3906DC0044D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 21:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B4D6206B1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 21:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mocDlmsy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BSLVQZvp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="WAWpnmVZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B4D6206B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcVjEAb+305xBvNpWsOO0dknJmSs8WzhZ4w8D28FP8E=; b=mocDlmsyDTCr/G
	JwHGVjHuuqwuFuM7reXCn/bdD+NssTJA6mlbH2nInI+zk+FqWL2D+G5GGd4UK+/r+dSji5/xr3wpI
	/iuuNE3Va4Kvj0GIS/AYWcJ+s9Q0VbDvgJDPm2GV/4x7pTiL28qte7/Pjt07WeLKqzIMRAWcQoinr
	7aT1d3DBW0VC2tZp4Eu96wCvJLQhJwk2Co5bMA64fd6wEFj+MCguhf8hlr+iyQd52eF1MxUC5P/IP
	PvtZj8l9DUfY3Iv5NB8byuW7OnqD4ZfUkWDw7NdXxDdZEwzLD9ueMX+wvmEBeny3vccIvkxnzTlSj
	3n+guhYUkWfdT8ooqYaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC9FS-0001Hd-Qt; Wed, 11 Mar 2020 21:50:42 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC9FP-0001H4-SF
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 21:50:41 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3EE98C0F71;
 Wed, 11 Mar 2020 21:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583963439; bh=C0K2qZU82TfJhc0VSD9CwYZOr6DjwlWE/C/oTfMqlEg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BSLVQZvp6ol5JxiLFt63P3tonD4ippzfa1J8X4xIFdCnfxe9zHS6pW3sfhxbHLIvq
 1VbSY9LYNUNsZs7thk7Npij++uFLqYYBaAlub0UChCvbA4B57KmHWQ6ks18UkV1I9F
 KwvnH2V6oHMv60TN5nVMQrdrjaRZWksuizsn0ROVDo5ANI4/5yjrpCaAP3SFFVLqn6
 4kbOlZhuyHahXNfJsrZP7xaX2Y5Fm5PAsLNDdNu6SHb0vt1sIOkZ6gbm7yvzMigc/5
 G80YeBMhk/NJZYdS89MP6G+y48wDUk8zyEot2HQo4MtAfnhcta6AOBzXRldlt4T0Ij
 Iaz9fFppT/QIw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1236FA0081;
 Wed, 11 Mar 2020 21:50:39 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 11 Mar 2020 14:50:32 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 11 Mar 2020 14:50:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMMVAnHb5DYHeeBG/bq5x/KCzB86/Gfp2FCy9BRQbbg4qsg9qx6JHRRATSCUXRD/7vlAIGTQFlfsLLEfH2tg995w0ot873YpKNovgUJHZ5gRp+NkIHFfHK0SmnwftdJOgCIC8WP1V4PCSn5E02aLskI3u5Ng6Asi2PpXCHdnDOFR9VnyrPisKWJx3njPvyAtq68saNQLuP2CSvZrXk79W4J1bDHCuaa445VsivCuDXJo8HT8vy/TNhvEZIGH+GQN+KwdQYfJF01BNbmgXL7VpI25/M9smTc0gQfTnJjY3fxcmInntX6TIYddTZ1DJfBZyJqs1AQsqqNltGHRRcJfuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0K2qZU82TfJhc0VSD9CwYZOr6DjwlWE/C/oTfMqlEg=;
 b=SVnHV/yyCxTWuD1vyk9aEcHsyvBO6DIiIsiUZ8n/wdf6U91Pni1hP5dd8tKtmCQb2u3mb2g3XekUJ0fcyRnolAxzw8b1drpqipW10bJtBzwqPYyHlvBU4YN+GETrl8p0sjobIul+usrPR585pvZAlXzvtCFZoBRqL7Bo7Pf6fC/T8LIDgGhzLErRxF+p17kPNDJRmj89hpqBklFgvuF02VUBBgMiUD38jIkGQyaMFWF7iMPi9vSwOvF6DQTfUNTlgTswfAkiirsKE0T2H+lfWaPP2f3QkPiGOfYYtrEDbdUlxbDdo/fCVnPxaD7mIOfT0Pp6pHzO+myxv9vbchSZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0K2qZU82TfJhc0VSD9CwYZOr6DjwlWE/C/oTfMqlEg=;
 b=WAWpnmVZI/v+k11b3rQDdCzRRtnrHs85XkwiUWmyjRYLbMfxxa5Du3i+rwBJMEsrqUC8svG1Gcf4EcYqJcqyYTT6HkQ9WCdudKUXY/xjCYWTwemZShyF5R1PaFK4knl/QDRouhNgFaJCWYVBkpp402edWcS/y+XcvoCrQwk4roc=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2984.namprd12.prod.outlook.com (2603:10b6:a03:da::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Wed, 11 Mar
 2020 21:50:30 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 21:50:30 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: DJ Delorie <dj@redhat.com>
Subject: Re: How to elf/tst-ldconfig-* in cross test setup
Thread-Topic: How to elf/tst-ldconfig-* in cross test setup
Thread-Index: AQHV9+0woNXRhuel20mQ2JZYi4Qst6hD7lCA
Date: Wed, 11 Mar 2020 21:50:30 +0000
Message-ID: <1e5222c2-5e79-1cbe-1bc1-ea1c31f920a3@synopsys.com>
References: <14513500-39f7-00a3-1d1c-4d8e4d6f24a3@synopsys.com>
 <xn36ae60br.fsf@greed.delorie.com>
In-Reply-To: <xn36ae60br.fsf@greed.delorie.com>
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
x-ms-office365-filtering-correlation-id: 4b17f589-2fa4-4522-2acd-08d7c60637e7
x-ms-traffictypediagnostic: BYAPR12MB2984:
x-microsoft-antispam-prvs: <BYAPR12MB2984814DA48C3D8B88B10B33B6FC0@BYAPR12MB2984.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(376002)(396003)(136003)(199004)(2906002)(6506007)(2616005)(54906003)(36756003)(31686004)(316002)(71200400001)(186003)(4326008)(6916009)(53546011)(26005)(6486002)(6512007)(81156014)(81166006)(31696002)(8936002)(5660300002)(86362001)(66946007)(76116006)(66476007)(8676002)(64756008)(66446008)(478600001)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2984;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bq85GPAJl4vTMILFdBomdV2YRuoX8uI3VfmEXpal1LTWyEFa3ROZ8askj9X4j3giDqqykCCP7ulbXEGekhL+yUR/AHh3aZ5c6I+8ro3WKCceQpG4lwhgTCKznZqHUvHjIzGJC5YmaD2YaVzFedxhOStIP9Q5SQ7Sy2fkBf1bV+KzJwcHy7MtF4fmPWVsZUMVxBbuNf8Osr6HgOMPAKKYpP+tR6lAWP9USgqiSah7obwvEYKTwhssV9oKxcnHSymiCutXov7Sbvvr5musHvprNWC4MRKrwvRcXRAe7I8RPKwj8y5RDvQZgciVTC2mq5CK78m/EFX6TNuOMFXl06pGfIsEJ7FqVDD7Gp8zZmJAc5h6d0yN8e5NhZDLX5hxHU6JJHCau4JIQT0985cU11OJL0EaDDLaWaeq5MZ1456TvQNiM7DzK0WLWskLvwashO8V
x-ms-exchange-antispam-messagedata: LIH/1ouyl9A8rn/foEQfFHK+vUqu//LmuEnzKH/pUjpCgjvP/wHlJn20Ek/+0di0KKTAE7FIUFAMejVUEzXUiMvxY2icvPtDoVrjsSLc80UD+IH6Ki11Il6kFhR0cJWGSO03oxNWp7hT1opKujZL6w==
x-ms-exchange-transport-forked: True
Content-ID: <93F2F2A6E11753499F2D1B0148EA5464@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b17f589-2fa4-4522-2acd-08d7c60637e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 21:50:30.5245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WKtPfn531NVJ0zknfgkGFMucX6niTYF0HSxPpYqLRv4bGtW+o2Lo3puMGEapPEXb4f5av9DPEWnB+Yxfqr3Y3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2984
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_145039_986051_D5522A9C 
X-CRM114-Status: GOOD (  13.00  )
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

On 3/11/20 2:36 PM, DJ Delorie via Libc-alpha wrote:
> Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org> writes:
>> The issue is expected src-path for dso.
>>
>> | [pid   168] renameat(AT_FDCWD, "/usr/lib/tst-ldconfig-ld-mod.so", AT_FDCWD,
>> |     "/tmp/tst-ldconfig/libldconfig-ld-mod.so") = -1 EXDEV
>> |      (Invalid cross-device link)
>>
>> In cross setup, /usr/lib needs to be the host path where test is built or the dso
>> needs to be copied over to target at the canonical location. I'm not sure what the
>> right approach is so any pointers would be great.
> 
> This rename should be happening inside the test-container, in a
> subdirectory of the build, so should not be a cross-dev link.  Are you
> trying to run these tests manually?

No, I'm running this is a cross-compiled setup where the test artifacts are on a
NFS mounted host. Here's the full strace for test


$ strace_static -f
~/br/build/glibc-867196a7635/build/elf/tst-ldconfig-ld_so_conf-update

execve("~/br/build/glibc-867196a7635/build/elf/tst-ldconfig-ld_so_conf-update",
["~/br"...], 0x5ffffdc4 /* 11 va0
brk(NULL)                               = 0x1a000
uname({sysname="Linux", nodename="hsdk", ...}) = 0
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or
directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file
or directory)
openat(AT_FDCWD, "/lib/tls/libdl.so.2", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such
file or directory)
statx(AT_FDCWD, "/lib/tls", AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT,
STATX_BASIC_STATS, 0x5ffff164) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\303\0\1\0\0\0<\v\0\0004\0\0\0"...,
512) = 512
statx(3, "", AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_BASIC_STATS,
{stx_mask=STATX_BASIC_STATS, stx_attributes=0, stx_mode=S_IFREG|0755,
stx_size=309012, ...}) = 0
mmap2(NULL, 16516, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x20020000
mmap2(0x20022000, 16384, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x20022000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\303\0\1\0\0\0\340\264\1\0004\0\0\0"..., 512)
= 512
statx(3, "", AT_STATX_SYNC_AS_STAT|AT_EMPTY_PATH, STATX_BASIC_STATS,
{stx_mask=STATX_BASIC_STATS, stx_attributes=0, stx_mode=S_IFREG|0755,
stx_size=24324580, ...}) = 0
mmap2(NULL, 1060392, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
0x20026000
mprotect(0x20122000, 8192, PROT_NONE)   = 0
mmap2(0x20124000, 16384, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xfc000) = 0x20124000
mmap2(0x20128000, 3624, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS,
-1, 0) = 0x20128000
close(3)                                = 0
mmap2(NULL, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
0x2012a000
arc_settls(0x2012a478)                  = 0
mprotect(0x20124000, 8192, PROT_READ)   = 0
mprotect(0x20022000, 8192, PROT_READ)   = 0
mprotect(0x16000, 8192, PROT_READ)      = 0
mprotect(0x2001c000, 8192, PROT_READ)   = 0
mmap2(NULL, 8, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0) = 0x2001a000
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
child_tidptr=0x2012a06c) = 2322
/home/vineetg/arc/BR-glibc/strace_static: Process 2322 attached
[pid  2321] rt_sigaction(SIGALRM, {sa_handler=0x123f8, sa_mask=[ALRM],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x200513f8},  <unfinished ...>
[pid  2322] prlimit64(0, RLIMIT_CORE, {rlim_cur=0, rlim_max=0},  <unfinished ...>
[pid  2321] <... rt_sigaction resumed>{sa_handler=SIG_DFL, sa_mask=[],
sa_flags=0}, 8) = 0
[pid  2322] <... prlimit64 resumed>NULL) = 0
[pid  2322] setpgid(0, 0 <unfinished ...>
[pid  2321] setitimer(ITIMER_REAL, {it_interval={tv_sec=0, tv_usec=20},
it_value={tv_sec=20, tv_usec=894348}},  <unfinished ...>
[pid  2322] <... setpgid resumed>)      = 0
[pid  2321] <... setitimer resumed>{it_interval={tv_sec=0, tv_usec=0},
it_value={tv_sec=6917526297652493452, tv_usec=2306054381734274040}}) = 0
[pid  2322] statx(AT_FDCWD, "/var/cache/ldconfig",
AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT, STATX_BASIC_STATS,  <unfinished ...>
[pid  2321] rt_sigaction(SIGINT, {sa_handler=0x123f8, sa_mask=[INT],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x200513f8},  <unfinished ...>
[pid  2322] <... statx resumed>{stx_mask=STATX_BASIC_STATS, stx_attributes=0,
stx_mode=S_IFDIR|0700, stx_size=60, ...}) = 0
[pid  2321] <... rt_sigaction resumed>{sa_handler=SIG_DFL, sa_mask=[],
sa_flags=0}, 8) = 0
[pid  2322] statx(AT_FDCWD, "/tmp/tst-ldconfig",
AT_STATX_SYNC_AS_STAT|AT_NO_AUTOMOUNT, STATX_BASIC_STATS,  <unfinished ...>
[pid  2321] wait4(2322,  <unfinished ...>
[pid  2322] <... statx resumed>{stx_mask=STATX_BASIC_STATS, stx_attributes=0,
stx_mode=S_IFDIR|0755, stx_size=40, ...}) = 0
[pid  2322] brk(NULL)                   = 0x1a000
[pid  2322] brk(0x3c000)                = 0x3c000
[pid  2322] renameat(AT_FDCWD,
"~/br/build/glibc-867196a7635/build/elf/tst-ldconfig-ld-mod.so", AT_FDCWD,
"/tmp/tst-ldconfig/libldconfig-ld-)
[pid  2322] write(1, "error: tst-ldconfig-ld_so_conf-u"..., 44error:
tst-ldconfig-ld_so_conf-update.c:78: ) = 44
[pid  2322] write(1, "Renaming/moving the DSO failed: "..., 57Renaming/moving the
DSO failed: Invalid cross-device link) = 57
[pid  2322] write(1, "\n", 1
)           = 1
[pid  2322] exit_group(1)               = ?
[pid  2322] +++ exited with 1 +++
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
