Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE26FC32771
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 22:41:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 734B82081E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 22:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Da9DF33I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Izmj4Z8t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="QrKulU74"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 734B82081E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnDbXE/aOqoP/DHAQR9OMg0DR9oPabM6Cnd+yrAFDps=; b=Da9DF33IcvTJpT
	QXc/xQonPFE4lACdAEXRqKWPS05HXdCnBBesyyvqq3i2xgMW45tShlNWkROdD2LW2jEqk/+MNreOG
	UsxUndGH21cz4aHcGTMR0xzgAS3SLp0KaQ7SrpMJw7D+TFUuPxkLCt2A31wiJ6rHYUlnT3N+zKRyn
	rWZ/pEBOeLH+7E7VlVEw7IZildt24Djud4FfVmQC8cQ2gblWHkgq15Xs7JiwJQksoHMEKSWBjc8iH
	c3RHraSz8cMtPtzt2nW6sktqf5I7Slt9JbLaeBpieMy9pSdDAITJXHpwUT+pf141/cnMO7YvsgkRa
	K1ZwFxw7YyFsiRgXIFtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irrMD-0001bt-8n; Wed, 15 Jan 2020 22:41:49 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irrM8-0001ai-Uh
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 22:41:47 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 34953C0525;
 Wed, 15 Jan 2020 22:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579128103; bh=6kaU6BnLDw7i23UTFvJ15v96LtaiTPFv2YflCOwPu4s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Izmj4Z8tDwXYr97YjfSMzWJQW8JEYstDPNCwqrfxtrW39jKD4UiP8JMubd/FlMPx5
 b5SQ8YkB+byrESE+9zOpmBRR4fqdxLb6H+Sv+ytKe4B2Ro9jWm3Bo1pjzaKxe0K2X9
 nhVfczOa6uu78G7DeP++sE5POvibDDZrETZbo6an9PCjyKM4EnXtza2J3RSSQ2tK0C
 06G8H4tVIcakrY0FUfrYZ98TLzuBtuOjq4uSQCa3KUdwbFh9zBTGA8XoHBY4Yd6pWu
 DbIfi8RYUfE64pnfdB1Tux5p9Sl7LVgH6GWNWWV7FJmm2YJr6qbgicez+4I/uoe+1c
 LDFl1r4rMOj6Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E837BA0067;
 Wed, 15 Jan 2020 22:41:36 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Jan 2020 14:41:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Jan 2020 14:41:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PG18A0WB1savvhYx8DZto+PSatuzsvvpIv60dc8wx5Iiu0F1zE41sX4JYE3zE7CcTs2gCt5WS0cRE9AMz1lj9fR3pdTMB1JuVKQylbzvvYFOZEhNayaEfYzk+Z6i0z0fA97EwHmICASP2FYnOuT3XZbNvSxLFcMq/WMskNU9SsTjVKcvnC6HllO/Y3sDIhrgXmmbtKitRfJcCb9xA6WrNjh099jlsiCRmHv8sEQVavs23WEH8drWeNx5CyRdDkSRgwzOgUCLM5UrQ8u2nTcEcX5KY4ydN7qXZvI2EHmwXahiGP16RasAOpKAkydESX1oFeftxaMGfOPXDbjjdfq43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kaU6BnLDw7i23UTFvJ15v96LtaiTPFv2YflCOwPu4s=;
 b=YbiMtfVkhUpWKEFjCeHDVLSzaugPvz94w9Vy1QXtWiEcnCDQSOuEN/3ptjfPKTx4eNqe8UJTjNDAUIA3xR7sP2W6EDcD/vuWxVXis5tfTGd5W22CnfQQcVHjJSEW2UyktJy5qfqV5Z5pmL75b7Hi2O47gUXgm5IizmGbqVFRwQODxbaIv9uRYS2+L1qK/xCqkEJNBd06pF41Ul4W7roBc6tTPMKjBCKJQP1iwWe4mKl+1wbuWPo8nrC8J34Ns6edLAIUXrhl08R3SMElxf29e4ib9/M15vG4SEV9nwwrI+Tz1ulpjzstUbrzDHzFeF4na9bAW14S3qhU8ghXKoogeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kaU6BnLDw7i23UTFvJ15v96LtaiTPFv2YflCOwPu4s=;
 b=QrKulU74NsP62eTrvLQvjOqBG/nKhvPUiLkSVZS55AfEzA6gLW1SoduEyETJCer9+4yZUt+OsYGuz/wJN6uispCkrTxXw6Z/2f5HsvJ5ONLpWbDqAwLNXtDYhGzaA7/V6dVSCX4tcwrfRs+0cPc06dd/5cE4lEVC0+QmwAdZVtE=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Wed, 15 Jan 2020 22:41:20 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Wed, 15 Jan 2020
 22:41:20 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Christian Brauner <christian@brauner.io>, Arnd Bergmann <arnd@arndb.de>
Subject: clone3 on ARC (was Re: [PATCH v3 2/2] arch: wire-up clone3() syscall)
Thread-Topic: clone3 on ARC (was Re: [PATCH v3 2/2] arch: wire-up clone3()
 syscall)
Thread-Index: AQHVy/TngCclMbwH00CGms7u4UXAag==
Date: Wed, 15 Jan 2020 22:41:20 +0000
Message-ID: <a58c8425-83a3-b64c-339a-7e94a72f4bee@synopsys.com>
References: <20190604160944.4058-1-christian@brauner.io>
 <20190604160944.4058-2-christian@brauner.io>
 <CAK8P3a0OfBpx6y4m5uWX-DUg16NoFby5ik-3xCcD+yMrw0tbEw@mail.gmail.com>
 <20190604212930.jaaztvkent32b7d3@brauner.io>
In-Reply-To: <20190604212930.jaaztvkent32b7d3@brauner.io>
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
x-ms-office365-filtering-correlation-id: 57f91a18-6ee4-421a-95c1-08d79a0c0ab3
x-ms-traffictypediagnostic: BYAPR12MB3176:
x-microsoft-antispam-prvs: <BYAPR12MB31764FAE45B4B67442116A1EB6370@BYAPR12MB3176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(136003)(39860400002)(396003)(189003)(199004)(186003)(31696002)(31686004)(5660300002)(7416002)(6506007)(26005)(71200400001)(110136005)(316002)(36756003)(478600001)(86362001)(4326008)(54906003)(53546011)(64756008)(8936002)(81166006)(66556008)(66946007)(66476007)(8676002)(76116006)(6486002)(6512007)(2906002)(2616005)(81156014)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3176;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rzyKHcHQCSwkcDFNMj42j1MSQ54Xfozr8Cp79Oy55uokY63yJLzt9Xai/exOCGgJwxWyylqtMiqMVix39li3sv05Wg7KeaDvmZ9jeiOIQIogU39Jam9KQxOCA8a4gXFzePBEaz4yIsFPz7O8wDSvmYWAw/HDBaOBg00NwwxRq/bFV9LNB3pd10oEuOWCdBtK/ceIu7X22K9TzZkWomLQZnmT9Yb391U0DUQoyql+3lu9rtVgNNP1S6ZdCeaOfw2lGucpIMEhzhaj4py4EBQ/M+1p7fx1CIZl34q0BblDrY0KmIUJsGrvpqX9wT1YGW0Ik/IIzMzHuSDqCBJ4KTRPOriA0FiDSAmdrbRJ7dk61VUIcxgAugUpyBtSmgdE+AV8BRhnxsuh9DwhbL4prOz9RAVyME+50Rhi8Rr8j2LwulBXswSH7DfmEa0NrB7Ph1D4
x-ms-exchange-transport-forked: True
Content-ID: <BB017E12F10A4D488BE280BF32F60C06@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f91a18-6ee4-421a-95c1-08d79a0c0ab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 22:41:20.4162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FeYhHoSm3clZwAsCf+R5XoBOu/krrgTXV8zMSaVDqgR2/wVVbJE7UycWLxIUqmFv9tbUqiy3NG1I+PaWrC2e6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3176
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_144145_209290_3AED7175 
X-CRM114-Status: GOOD (  23.18  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Linux API <linux-api@vger.kernel.org>, the
 arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, David Howells <dhowells@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Adrian Reber <adrian@lisas.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 6/4/19 2:29 PM, Christian Brauner wrote:
> On Tue, Jun 04, 2019 at 08:40:01PM +0200, Arnd Bergmann wrote:
>> On Tue, Jun 4, 2019 at 6:09 PM Christian Brauner <christian@brauner.io> wrote:
>>>
>>> Wire up the clone3() call on all arches that don't require hand-rolled
>>> assembly.
>>>
>>> Some of the arches look like they need special assembly massaging and it is
>>> probably smarter if the appropriate arch maintainers would do the actual
>>> wiring. Arches that are wired-up are:
>>> - x86{_32,64}
>>> - arm{64}
>>> - xtensa
>>
>> The ones you did look good to me. I would hope that we can do all other
>> architectures the same way, even if they have special assembly wrappers
>> for the old clone(). The most interesting cases appear to be ia64, alpha,
>> m68k and sparc, so it would be good if their maintainers could take a
>> look.
> 
> Yes, agreed. They can sort this out even after this lands.
> 
>>
>> What do you use for testing? Would it be possible to override the
>> internal clone() function in glibc with an LD_PRELOAD library
>> to quickly test one of the other architectures for regressions?
> 
> I have a test program that is rather horrendously ugly and I compiled
> kernels for x86 and the arms and tested in qemu. The program basically
> looks like [1].

I just got around to fixing this for ARC (patch to follow after we sort out the
testing) and was trying to use the test case below for a qucik and dirty smoke
test (so existing toolchain lacking with headers lacking NR_clone3 or struct
clone_args etc). I did hack those up, but then spotted below

uapi/linux/sched.h

|    struct clone_args {
|	__aligned_u64 flags;
|	__aligned_u64 pidfd;
|	__aligned_u64 child_tid;
|	__aligned_u64 parent_tid;
..
..

Are all clone3 arg fields supposed to be 64-bit wide, even things like @child_tid,
@tls .... which are traditionally ARCH word wide ?


> 
> Christian
> 
> [1]:
> #define _GNU_SOURCE
> #include <err.h>
> #include <errno.h>
> #include <fcntl.h>
> #include <linux/sched.h>
> #include <linux/types.h>
> #include <sched.h>
> #include <signal.h>
> #include <stdint.h>
> #include <stdio.h>
> #include <stdlib.h>
> #include <sys/mount.h>
> #include <sys/socket.h>
> #include <sys/stat.h>
> #include <sys/syscall.h>
> #include <sys/sysmacros.h>
> #include <sys/types.h>
> #include <sys/un.h>
> #include <sys/wait.h>
> #include <unistd.h>
> 
> static pid_t raw_clone(struct clone_args *args)
> {
> 	return syscall(__NR_clone3, args, sizeof(struct clone_args));
> }
> 
> static pid_t raw_clone_legacy(int *pidfd, unsigned int flags)
> {
> 	return syscall(__NR_clone, flags, 0, pidfd, 0, 0);
> }
> 
> static int wait_for_pid(pid_t pid)
> {
> 	int status, ret;
> 
> again:
> 	ret = waitpid(pid, &status, 0);
> 	if (ret == -1) {
> 		if (errno == EINTR)
> 			goto again;
> 
> 		return -1;
> 	}
> 
> 	if (ret != pid)
> 		goto again;
> 
> 	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
> 		return -1;
> 
> 	return 0;
> }
> 
> #define ptr_to_u64(ptr) ((__u64)((uintptr_t)(ptr)))
> #define u64_to_ptr(n) ((uintptr_t)((__u64)(n)))
> 
> int main(int argc, char *argv[])
> {
> 	int pidfd = -1;
> 	pid_t parent_tid = -1, pid = -1;
> 	struct clone_args args = {0};
> 	args.parent_tid = ptr_to_u64(&parent_tid);
> 	args.pidfd = ptr_to_u64(&pidfd);
> 	args.flags = CLONE_PIDFD | CLONE_PARENT_SETTID;
> 	args.exit_signal = SIGCHLD;
> 
> 	pid = raw_clone(&args);
> 	if (pid < 0) {
> 		fprintf(stderr, "%s - Failed to create new process\n",
> 			strerror(errno));
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	if (pid == 0) {
> 		printf("I am the child with pid %d\n", getpid());
> 		exit(EXIT_SUCCESS);
> 	}
> 
> 	printf("raw_clone: I am the parent. My child's pid is   %d\n", pid);
> 	printf("raw_clone: I am the parent. My child's pidfd is %d\n",
> 	       *(int *)args.pidfd);
> 	printf("raw_clone: I am the parent. My child's paren_tid value is %d\n",
> 	       *(pid_t *)args.parent_tid);
> 
> 	if (wait_for_pid(pid))
> 		exit(EXIT_FAILURE);
> 
> 	if (pid != *(pid_t *)args.parent_tid)
> 		exit(EXIT_FAILURE);
> 
> 	close(pidfd);
> 
> 	printf("\n\n");
> 	pidfd = -1;
> 	pid = raw_clone_legacy(&pidfd, CLONE_PIDFD | SIGCHLD);
> 	if (pid < 0) {
> 		fprintf(stderr, "%s - Failed to create new process\n",
> 			strerror(errno));
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	if (pid == 0) {
> 		printf("I am the child with pid %d\n", getpid());
> 		exit(EXIT_SUCCESS);
> 	}
> 
> 	printf("raw_clone_legacy: I am the parent. My child's pid is   %d\n",
> 	       pid);
> 	printf("raw_clone_legacy: I am the parent. My child's pidfd is %d\n",
> 	       pidfd);
> 
> 	if (wait_for_pid(pid))
> 		exit(EXIT_FAILURE);
> 
> 	if (pid != *(pid_t *)args.parent_tid)
> 		exit(EXIT_FAILURE);
> 
> 	return 0;
> }
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
