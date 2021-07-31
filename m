Return-Path: <SRS0=+3F3=MX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5836BC4338F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Jul 2021 23:13:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF9661019
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Jul 2021 23:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFF9661019
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDmc3bGNV+kBXG32gR4tqCAGAkAEV21qXeXr3ZNwafI=; b=kIPIFzaFxcNuFi
	pUtVP5iWWs/A4Q2/O6ETDYkEEqn3DLHBRkknStTECrV53X1FO/6BziXrx4vJxPNVWk4PvgZBnl59o
	OvUaequhedpEyGCpAuyergTjjduVqwg5z2VejtRwEGmbc7IAJk2TK5CVCGeVtCIIWR8oXL8XPc92w
	IDk2bkqi8sDJjt+iB2PqnZKCu4EQ5Opdr8ny3I+IoK/Ud0XOQcZIWBwfJI7zdtf+FwVVgs3Dn8x/b
	U9FJdphOtG6FX5Rr9AabvmzC3grnsqMr+BFv6JTSUssP71rA+l/rM6thK72ZzZ3Gj7MXfM3Nm75L3
	mLg0ohLACuLIsk4J7TkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9yAV-00CS0u-6o; Sat, 31 Jul 2021 23:13:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9yAQ-00CRzs-HK; Sat, 31 Jul 2021 23:13:19 +0000
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 379DF40AAB;
 Sat, 31 Jul 2021 23:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1627773196; bh=/S86EVYPGY9xO3kUoJy56OQzYShJeYu8vWMcA/vI1hU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=cSknRoUDYnV5K4e9RsktZTB3QGt2oCEb40SBNrfyh9F+EmNso1AAl6mimKoLm4Z9q
 khyQvwqSZMh/b/Bx1hwv6KmrDnrBMAkYlKcvTB6+yI+xCL5FSzLYTByDQnJ2OvadN+
 3F9QsvB9tzuxlD09nUjofDPzIEIr0tmc8Cu9mI0vuYnj2NMrIug8z2eYy+4czpfEXj
 Z3LmxLa5LXEHOkJWlry4xLGnfMHtmXYTKDJbbWD4mMGtv/4vHxsZdh+8/LFn9vS/5M
 Z+6h3mB1Pq6c8L7GYiHzosHPQZDDYwhJii5aBORBdt6MwcDUNT/C6CovEDYJobnFjO
 ynYFu45BOhzmQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 96039A00A0;
 Sat, 31 Jul 2021 23:13:02 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2047.outbound.protection.outlook.com [104.47.56.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id EBF978021F;
 Sat, 31 Jul 2021 23:12:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YG5vmKaa";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpwXj4pwuqtmFIDKSh6+tPV8Wvzx6rPiDM61wQAwVZW+dvzyJzLx7AQnna/76mETD9TZA4AokNwdISek/EiDM6jKa64zVH5l3Xf9jLGzNzkisXj41u5Bz4uVM6ATgRhrLn4hnlX78B7RvK4qfnpjpMEeh2jMvg6PHsU5JAp6wQFeF7tHmMLlJs2JhaoYo6YhOCo6wSl6PbMORKmYdM8Zl8KvrJx/WMnSgy/HiV01FmJKFDhByq7EzrfZCwd8gkWiJukzRFIvd03LxgtQDZbw/uWS35QDiLjJJwhPBIf+K36bmBx2TOPL28+e5i4oJcPbKcEyzHTt6wnTSeJ7m7HBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/S86EVYPGY9xO3kUoJy56OQzYShJeYu8vWMcA/vI1hU=;
 b=Ugt3bcB263NQ840znsmCrwSrZCCjnHTSbbMSf3w03NJ1e9IATBiWuP9btT2zJZDKyqL3vMnWjkTBuaLTbdeuxp2lsktJ9kE67lKwT2FUc5kdgrZVcCekXSA/74Og5NkIg9D6g304DIU75OmgQRU3vtOoEGT4LgHjdRCN5+hRoS1/uzWN1cgvNlpw+AeT8cGlhX8C5pXbGDQ8ifs6VEsA0j+zE0dxWvHSvlSB8V4CIj42CCpsRvWUyxI0uGuuwj/r6ut5fHD7TNrWr2clOs3Pze3N3+20xTnP1yC06RrcqmguIJ6MUs92yCaxgzV7sRds1I+eb4QxCzMCUPA6nH5AOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/S86EVYPGY9xO3kUoJy56OQzYShJeYu8vWMcA/vI1hU=;
 b=YG5vmKaaTr8H8brX5rjKTHUnmj2TIgOVM/BnGwDsLv37PoaFI78mHpo97eW7w0cnAEtfgxQVbwI7la7nLB6605apE4qQrON0rxo+18q6Cy+kEKHeMHuCvyMsiZRoS3jt2urRBeFdIA08oyOzGgFlT5HL4upq6yltkbqR3lpRE4U=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (20.178.54.154) by
 BYAPR12MB4629.namprd12.prod.outlook.com (20.179.59.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.25; Sat, 31 Jul 2021 23:12:39 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::acbd:42ac:9bab:39ee%3]) with mapi id 15.20.4373.026; Sat, 31 Jul 2021
 23:12:39 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
CC: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Linus Walleij <linus.walleij@linaro.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Nick Hu <nickhu@andestech.com>, Thomas Gleixner
 <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Peter Zijlstra <peterz@infradead.org>, Catalin
 Marinas <catalin.marinas@arm.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, YiFei Zhu <yifeifz2@illinois.edu>,
 Greentime Hu <green.hu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <monstr@monstr.eu>, Helge Deller <deller@gmx.de>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Guo
 Ren <guoren@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Richard
 Weinberger <richard@nod.at>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Rich Felker <dalias@libc.org>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>, Max Filippov
 <jcmvbkbc@gmail.com>, "linux-hexagon@vger.kernel.org"
 <linux-hexagon@vger.kernel.org>, "linux-xtensa@linux-xtensa.org"
 <linux-xtensa@linux-xtensa.org>, "H. Peter Anvin" <hpa@zytor.com>, Will
 Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "linux-um@lists.infradead.org"
 <linux-um@lists.infradead.org>, Andrey Konovalov <andreyknvl@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Brian
 Cain <bcain@codeaurora.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, Stafford Horne <shorne@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Chris Zankel <chris@zankel.net>, Vasily Gorbik
 <gor@linux.ibm.com>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, Jonas Bonn <jonas@southpole.se>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Kees Cook
 <keescook@chromium.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Colin Ian King
 <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vincent Chen
 <deanbo422@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andrew
 Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Mark Rutland <mark.rutland@arm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "openrisc@lists.librecores.org"
 <openrisc@lists.librecores.org>
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
Thread-Topic: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
Thread-Index: AQHXhcxPA6EPe6ekOUigKes8hDjBc6tdt4MA
Date: Sat, 31 Jul 2021 23:12:38 +0000
Message-ID: <1036d104-44c1-b162-2262-973226628be2@synopsys.com>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11f32b68-098f-4b98-4dd5-08d95478b105
x-ms-traffictypediagnostic: BYAPR12MB4629:
x-microsoft-antispam-prvs: <BYAPR12MB4629D5976007C72139678E93B6ED9@BYAPR12MB4629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gmFQOtz89sCyiTQut2zG1zFT0qpFyE0WSlhEbGxCJGfkjyhF+USRzUKzqwkodF8ZyRtyeOgj2zP134AurnC+Q+DpgsrlycwmfpeUPMbz93DtP24Oe568AkFxk3jMKKB4ze2zuTS53ReYfN6biZHJYYNvQiEn+dctWFX/I12PgztinH2/ugFnZbNpGNZ+heYU845Bozk739sSSxsa/LtyN+qzf3qpUNot2nTr3PCLBOyiO1zZBXug6kbXnq2FEOZ1oe+Aj/HBStz/mjw2vukJV5L+poZNNkHJFp8lBwpZAaI3kRQIgVyKXE5Q2rwC+Fxgr59Eqenwc7Haggm9MFSyqHSaB616ZNgFFit6Cyem7ebS0dOrwT4x4DPudHskmfx7ARtB98jxRP7JNsr+mjDMuaxsOu7XAdbeXaxA/PQ9fnglLyPn7iU4TrYbVCK+q9Gp16anRP3UkybeF5lUHpVdyset4ZUqgF+AZiT4JzMNXC+IhZeeSWMSRcN2C1+Bw0n5uMi9QjGyYNvdGKE3JfUBcBbWeXZyiEcvfhcMVwyMr1/Ax/yowBS8dC8wrkE4Hpd6YA4xNzje3rfUdWSK6gJrlHk34PIKfYY73g5q9V5meZMdfacvgx7vRYOMlAPRujYRQBBo1LA2th2vp5I5Y9TU9Sr2JwvTYeFH2+3krPTKHCzJqJ86q0BFC0Yr+guESlQdkXaQDVg+msTqnCYqTjQQV17Pv3VTmn68D2B8Ggf9oUbhwtewM51U74tspgcSgAEes0etk5PqoMEoZI07aUPmwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(136003)(346002)(39850400004)(71200400001)(54906003)(2906002)(31686004)(8676002)(110136005)(6512007)(64756008)(76116006)(5660300002)(66556008)(66946007)(478600001)(66446008)(66476007)(38100700002)(316002)(38070700005)(6486002)(4326008)(8936002)(122000001)(7406005)(186003)(53546011)(26005)(6506007)(558084003)(2616005)(31696002)(86362001)(7366002)(36756003)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmZ0ejc4cXpYMTkxUnBnY0lObXVWQ29JUFc2d0RlMjQvRS8wYndESDNkUEUx?=
 =?utf-8?B?elllWERCbVMxV29SelZjUmNSaXZESU9ER0xsMFFMQ1Rnd00vRTV0ckQyN1Vo?=
 =?utf-8?B?TG9jTlFIcTQxbk12TTBZdE4wTUJIUXZKeGx5blhmUm15NnE1aWVENXdmd0Fr?=
 =?utf-8?B?TEhNbWROcy90aTJHODNkVWl6bWdaajc1eS9VWmpLTWc4S2d1Vm9jOXJGcG9N?=
 =?utf-8?B?NE1kaUhEVDU4SEZFUjlUbE9aN1FBakVSNzNVRm8yaWFJRUF4MHFQK21FSENk?=
 =?utf-8?B?SlRvbkQ0WmptajNtcG1hNlhHZmRpWGNxSk5wWFlJNCthejRTRm0vemxwU1VE?=
 =?utf-8?B?K0xjT0YyYS9DUjg5V1ViWDdJcTZWYldvUUw1Q3F2NTVmUllUNnpVaHFJMlE2?=
 =?utf-8?B?Y2dQWXZqSzZEa1kwYlA1SlpNaEtEenFXT3NXNmYvT3ArVHpMV1p4cS93TGlW?=
 =?utf-8?B?NFJ1bkRnMk5QNzkvOTdtcHlJQ0FCRzlMZ3dnMGdjTlc5Q2JIbDZHbUptdGRI?=
 =?utf-8?B?RDljL1QzNXg4TlBYM0lvNHFjZ21rVGZ1OG5ONlkvR1ZXdytkWDJHTG1JQXVU?=
 =?utf-8?B?dkpySmNWNkRqL05XVUNRbkJyNWpORFFMT2FDV0dyeDI4bEZtRXc0SExMMzJ3?=
 =?utf-8?B?eEJ6N0V6by9GVkt2THM4eTRMcVhLRTJnZy8xWlpSNEN5bXFFMEY4ampYSTlZ?=
 =?utf-8?B?Q0JUNlR5UFN5cnpHWHM3a0V6T1RMcnNWazRqWFkrM0x6RjBLdkZMVklnTDVM?=
 =?utf-8?B?eGFKc2p5QlY2NTlxUFdxSlNrVmJ2QVBlZlN1U2Y1amVoNmhEZUZXZ1ZjT0pZ?=
 =?utf-8?B?Vk9tNTZET1BpWGZaSzFrN2lhQkN5aUNIOEM0UHVZTjI1UUkyQXBvUFhZR3da?=
 =?utf-8?B?cFRqbnZwNk5KUTJadFFINGhiM2JHUVBtMk1ZODNYUkxKYmVTcWNVS1duZWR0?=
 =?utf-8?B?aUh6d2Q4Z1ZxOUpVSHFaYnFmUG1RUWxjN3I4dGdadU53UkFPNGdoTTlMeWox?=
 =?utf-8?B?ekVLVWIzYmpwd3pLSnMwUy8vTk9RbU5VVlBMT0QyZkpDZ25rMDBGM0lZNWdN?=
 =?utf-8?B?ZTZ0YUFYK0RUbGVlUmNuSzc1OWM3Ykl3dXZEaWU1cnJSb3Q0MlVwTGRMdkgx?=
 =?utf-8?B?dkt0cDNFRFhtRWxsRllkQU1qZyt3UFlmMzRKbkpiTHgzd3U1OHgrekJGdm5O?=
 =?utf-8?B?dlZGUU8zbUJYdzFUK1hGRXFOYkRJWG9FNnFmZnVyZUI4RjA2SENoVVRpZ0pk?=
 =?utf-8?B?TVlHYVF4WEhpNjRyUzNxRkI5NWJScWlISUdDWWUwZ1QvaWR3ZmJqVXcrbkNQ?=
 =?utf-8?B?TDBWUzdURE9hR1dweVVKSnArZm1JS0Jqemx3eUIwWktOMUViTzhGUmkyRjdT?=
 =?utf-8?B?VWErdEtpRU8rQmJxck1aU3k0ajRNUkk2ZTBuYkV3TVluOVlnMm1PbEtYR1hi?=
 =?utf-8?B?UFdCZkh6akFEWTUyMlFRZU82VGhxeWZaVTZzNDRpcEFHRzkza2lKWmI5eHNK?=
 =?utf-8?B?R01xeEg4KzA2VnVnaWxkZTlOVDRmTXRYa2lFVFgySUVPbmZMNytzUDY2Zllv?=
 =?utf-8?B?OTd0eWVzdW5BOVVKaWlkUlZTSjcvOFNVWmZpRlhvUkRkWHROd3VTdFhxQW5Q?=
 =?utf-8?B?ejBTNFJTMjI1TTZVWDBSaURVSHhKVk9qOHhzaEwyeHR4anF3Y3N0ZDBqeEpG?=
 =?utf-8?B?aHkrY0VhV2puMUorRFFTT1RDUDBiYWZSSW52Q3dISzJFUldhZFQvanF1NS9Z?=
 =?utf-8?Q?IjB8kzYt4uw+NJgbH4=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <D343C53D18DD6D43ADCBB013B53C2A98@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f32b68-098f-4b98-4dd5-08d95478b105
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2021 23:12:38.8971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n591pRdiJ+MmbcbSM0oJpTzbEaSomMaacCyu2y3wQloG0Gf8tLeP4Y4IVvlSpPAu7VFslDybhx3kj+vNcxGOYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_161318_694980_9ABA8AF2 
X-CRM114-Status: GOOD (  14.92  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gNy8zMC8yMSAxMDoyMiBQTSwgTWFzYWhpcm8gWWFtYWRhIHdyb3RlOg0KPiBNYWtlIGFyY2hp
dGVjdHVyZXMgc2VsZWN0IFRSQUNFX0lSUUZMQUdTX1NVUFBPUlQgaW5zdGVhZCBvZg0KPiBoYXZp
bmcgbWFueSBkZWZpbmVzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1h
c2FoaXJveUBrZXJuZWwub3JnPg0KPiAtLS0NCj4NCj4gICBhcmNoL2FyYy9LY29uZmlnICAgICAg
ICAgICAgICB8IDQgKy0tLQ0KPiBbc25pcC4uXQ0KDQoNCkFja2VkLWJ5OiBWaW5lZXQgR3VwdGEg
PHZndXB0YUBzeW5vcHN5cy5jb20+wqDCoCAjYXJjaC9hcmMNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
