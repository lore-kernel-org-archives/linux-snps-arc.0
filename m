Return-Path: <SRS0=xDVn=CC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873A2C433E3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2020 18:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4878D20738
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2020 18:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1fWeK031";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q+nBY/R7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bQlBR/3F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4878D20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XvGViRBJObzgDzYLmTIZomTaUqlDIOWkQ3NtIhVVQhU=; b=1fWeK0316m7GdRCFeP0S+vJj/
	NtCJm8rzVbg+DC4IVEEs/FqV02dehYcxkCOtOZIrYq1sy7JyPBWqcPbxkRYLqPV+pJ7YSb48X5b1J
	kadEQTL0VGpyM2/RmIpzqBcx2GR9QAmXwDgIbeveQajqMVjtLsHqpQBLAzS21FsJKdw2ltOVpF6DJ
	tO1/54gAVmoerYkFpAzp8lg+xnf+vbt3TLz+O0iOpT1XNXnybuEDN0M4MvJKGKOWFusEbm7KhpIzL
	w0IT60smVqfc/eAk/e4fdNifv80RnUzKJB3ZDqUhjhl03qjHJ1DL4WTIe8Rg+9FdoFEOdqQK6JT6j
	WQeiXZaxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAH69-0000B3-Kc; Mon, 24 Aug 2020 18:21:37 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAH66-00009g-G2
 for linux-snps-arc@lists.infradead.org; Mon, 24 Aug 2020 18:21:36 +0000
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EDE79400DA;
 Mon, 24 Aug 2020 18:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1598293292; bh=I5+/X7lnRt3CXHHz0g1NT2k94yOsr3BAZwghEQepaMs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Q+nBY/R7wZYn3O2KdIizLeQ5wEI+36TDdFOmp/GZhCDZmrRSOhmtQGyxHBbnuHjhV
 cwuvNJOSvmCoTmJ2BU8nXc0h9O9xOukOMk7Ey+M3nwF/5VKIm8YzLUGqaIjNlwPVQf
 wTlPXNyXGNbSsickKV0myFmpeJmVyMoiOP/icCbu5S317GMx94LNSxhLYxFcGi100u
 1tcv3r0MythRfuPcNbtDpg6hWR0anmJEKeVO1A0/1blr/VP5j/MrYYSCpXGxu06avK
 qWLu9Ac5JORRdhR/MIz9/OE5ptt/DKOMwiBeafNT0NmuzV3HTUMkQ2wn8Q/Uh0XYqm
 XDAPgh0/O2soA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6C9B5A005C;
 Mon, 24 Aug 2020 18:21:27 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 076C9801E2;
 Mon, 24 Aug 2020 18:21:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bQlBR/3F";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfcDxXt+YR8VmFq5GlUfynVlVm4b9XPpmNPzh4YoZ+ZLbhQPe6skTdDBdYFlUiHrPlvED+tI7/y0CbYIVuNBs9mIR8Wy+5Ypcj0ipLse56c7TP3nP9Lfb2+1QuQPxor8fpOOpH/Rv0nZeCRjTsEpgXOpWocKSOpd4bhlVmQdSuzqQUXE6nCMoK5fMQ2m6RPCDATCEnWC4L7y47qtpYjpL8PE4bPfl1EFRalTXyBHywzIUJv2Ni7BSNZxF/Vylqg06DYItXaDYmyLaHUj3raPF57YhhWKMHQVxWU1AXnMgxg32whGWIVkpDJceWp9IMKcZb1qyvvQbJAh1Y7F71+UMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5+/X7lnRt3CXHHz0g1NT2k94yOsr3BAZwghEQepaMs=;
 b=BCvD27CFox/DNPnCg9eIToIqG2h3NpiADY3XfkMH5PnAt39sx2TFTM/KHUVClwd4jGRBYcV/OHzFkOELxZrQQ8/LT17eYRnhfDqMo0MWYWLH/OeohuoPwFoC5hR05YjEU5P0nheWCPcBGjQZ2UWRnoIYF+mZxI/2ziVpgyKIC5/C2lYFOpUC5/ajDc8RM4dQ2yjRBjVSEaXu0cfam1yftAT/Da3VjKZJABB7BPjqUgKxVMZ2xSw1YULYAkQomRCfnkiE8pd2ooKw5dJ7kLNicGKnM9twtjUbzy3t5GvFE4J+/hYiIvvHueE8KJQpex89SWX4t1IJ5C5bohIB2I6vIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5+/X7lnRt3CXHHz0g1NT2k94yOsr3BAZwghEQepaMs=;
 b=bQlBR/3FBXZlxA9ZR+dmcZQAiIhlatkOz8OOIbsKgOOc3dI9ryuOBiGlLSGhZXVs3k5xJe8tkNCFUWkFi6Ymqoq2SUtsnsDsqU5HKNXbvPKvf6Q8b6sVZ4Yd6aL3PonHjx0JYzKRYuyrQb8TBnV05sENqY1EqTIE8Z31Vs/bvEA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3350.namprd12.prod.outlook.com (2603:10b6:a03:ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 18:21:21 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 18:21:21 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kernel test robot
 <lkp@intel.com>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
Subject: Re: {standard input}:5973: Error: operand out of range (512 is not
 between -512 and 511)
Thread-Topic: {standard input}:5973: Error: operand out of range (512 is not
 between -512 and 511)
Thread-Index: AQHWef0l0UaEhGbt3ESFttATwdb/VqlHksAA
Date: Mon, 24 Aug 2020 18:21:21 +0000
Message-ID: <28384fea-4a07-c57d-04b0-f44f1c70adc2@synopsys.com>
References: <202008241018.RkyIlLKd%lkp@intel.com>
 <20200824095831.5lpkmkafelnvlpi2@linutronix.de>
In-Reply-To: <20200824095831.5lpkmkafelnvlpi2@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linutronix.de; dkim=none (message not signed)
 header.d=none; linutronix.de; dmarc=none action=none header.from=synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:2f8b:62c8:4c97:a7a2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be32e24b-abc9-4971-f6f6-08d8485a8098
x-ms-traffictypediagnostic: BYAPR12MB3350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3350B715110210C68F168388B6560@BYAPR12MB3350.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+nh6slxjgtGMHS9BQsmTjBQ2B8Gdigbs9M/YKgEEADe65EqWpWyOtovGPLVaSyMulBMuvBd+AEGOE+m6fQslnpiUNt0vLEC0dyp8RUVUPi5Vw9sfu3arsWmwZP2N3L2ZSJ8OAL+ZlX8EasQxQJJoijryzhPvT0WQ+8+DzZCkR2jlDGZgxTIDBkjk2f5bKAWa1LKCQWtemCVg59TKDVAsSdii+Uif9FcgHrML8a7YLzIm500Beb5Tltcw6QrGQMNqTQ15/AG/17zwukkthLA5cKtsdMPOqfNsvolTzICVZZjnSxRGqQ1KKxk+ikTAIbLL7QmmLUkM5+2KiDO+ZGz1jnbewIWmZu9f1lRWsylaO0tbwRkTmGm2/Nl4zJdFVvMxWqsFkNRmCKS7ByAPT7Ar3uHJTquQzBD/k5x/j2IEzn6X19p1paKiN+gJyWxkZMxYbd5vcCgNI3kUeAyVvZlaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(366004)(39860400002)(376002)(396003)(6512007)(2616005)(66446008)(36756003)(64756008)(6486002)(76116006)(8676002)(5660300002)(8936002)(186003)(966005)(31686004)(71200400001)(66946007)(66476007)(66556008)(478600001)(86362001)(107886003)(316002)(110136005)(4326008)(31696002)(2906002)(83380400001)(83080400001)(6506007)(54906003)(53546011)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3dUB5HIG0yptzotdsoR7hgkjojzLae0KFdoxt+xnI1WOsYWWkY0yHfi4NQKx1zkdbQFeEFLJheiiLI5+9rHTqHZUM4BWPXiTOdtQsD4914YbEeh3CpLZptiT1cMNdsm7EbeUsYwYIHG3KyU5tMVx8/4Klu8n4FMN+5XIEuiAmdVa6Ft19Zu1hJmfYLElVwNNMGPHV0af2aJdA5D/p1lCVYhwrDVheY8uy4AE0Vi/xtonNS831YFHTzmkzX1aYx87PdvAuP3tmWYJ3l+pPH+B0j2kZxCwntUgmzlBqBuj1OgoEgjDV2xONh5jK8PhjJWq0yb4EmHbCA007d8E8yZqn+1oHhJI/Dj9ERyqP3rL1Ovuzq9Tl8V5/gwQ65zayxroQDF/iIFOFjJNKnUVU3urjllgZuxGsiXi45hBW3n9y6q0QI8kdq8kHk1yVqqRi3LvfGqWzJyVCoz08xgO0xnEjMlxrPAFGgo2E3+N/LXyVtWP7j52oLSOY6BX7l7Rhi5OGFDRPkJb1DUKB5Cy2aWAIHJgD/yexuaTL0BVMp0eijbLMQWZgQItk3NMt3Tdb6wJfnlhwjoqfNzG6gF/YJ+jC74luYjA0RpNj/jUSmhG6aA5guoXxVOQACWOJPSYl+xT9dOH9/nVNU6Xi7MitNA/M7XI8m3tyVMYZH9hyVXn94gbdG+e3CYcj/6kMIOScVSN0JU1s47uZdgN7whZtBnZgw==
Content-ID: <0CB9EFBDF167744BB669F16689DDF3D7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be32e24b-abc9-4971-f6f6-08d8485a8098
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 18:21:21.2541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+GvouxJPHFn+CfF2P4aowtJ88F0EgPAZ57OF/MbJHoG//k7O4y02IPiV8GI2qKG21GG0jSfX0M5ZxcmxIUb3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_142134_957649_E32C3B91 
X-CRM114-Status: GOOD (  27.32  )
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ofer Levi <oferle@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

+CC Ofer

On 8/24/20 2:58 AM, Sebastian Andrzej Siewior wrote:
> On 2020-08-24 10:17:19 [+0800], kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   d012a7190fc1fd72ed48911e77ca97ba4521bccd
>> commit: de8f5e4f2dc1f032b46afda0a78cab5456974f89 lockdep: Introduce wait-type checks
>> date:   5 months ago
>> config: arc-randconfig-r004-20200824 (attached as .config)
>> compiler: arc-elf-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout de8f5e4f2dc1f032b46afda0a78cab5456974f89
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc 
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    {standard input}: Assembler messages:
>>>> {standard input}:5973: Error: operand out of range (512 is not between -512 and 511)
>>

The error above was fixed back in April:
799587d5731db9dc ("ARC: [plat-eznps]: Restrict to CONFIG_ISA_ARCOMPACT")

> I have here gcc 10 and the output is:

I suppose this is mainline gcc 10 ? Although it doesn't seem like compiler version
related.


> |  CC      arch/arc/kernel/signal.o
> |arch/arc/include/asm/bitops.h: Assembler messages:
> |arch/arc/include/asm/bitops.h:236: Error: junk at end of line, first unrecognized character is `0'
> |arch/arc/include/asm/bitops.h:236: Error: junk at end of line, first unrecognized character is `0'
> |make[3]: *** [scripts/Makefile.build:283: arch/arc/kernel/signal.o] Error 1
> |make[2]: *** [scripts/Makefile.build:500: arch/arc/kernel] Error 2
> |make[1]: *** [Makefile:1788: arch/arc] Error 2
> 
> the reason is that:
> | #ifndef CONFIG_ARC_PLAT_EZNPS
> | BIT_OPS(set, |, bset)
> | BIT_OPS(clear, & ~, bclr)
> | BIT_OPS(change, ^, bxor)
> | #else
> | BIT_OPS(set, |, CTOP_INST_AOR_DI_R2_R2_R3)
> | BIT_OPS(clear, & ~, CTOP_INST_AAND_DI_R2_R2_R3)
> | BIT_OPS(change, ^, CTOP_INST_AXOR_DI_R2_R2_R3)
> | #endif
> 
> and the config supplied does not accept CTOP_INST_AAND_DI_R2_R2_R3
> (which is
> 	#define CTOP_INST_AAND_DI_R2_R2_R3              0x4A664C04
> )


> and the assembler does not like that.
> After the removal CONFIG_ARC_PLAT_EZNPS I got to stage 2:
> |drivers/irqchip/irq-eznps.c:80:16: error: 'CTOP_AUX_IACK' undeclared (first use in this function)
> |   80 |  write_aux_reg(CTOP_AUX_IACK, 1 << irq);
> 

Indeed this is a problem I can reproduce. Enabling CONFIG_EZNPS_GIC on a non
ARC700 build causes the issue: the ctop header is inside platform code
(arch/arc/plat-eznps/include/plat/ctop.h) which obviously fails if not building
for ARC.

My solution is to move ctop.h to include/soc/nps/plat/.

> so I removed CONFIG_EZNPS_GIC. And then I ended with:
> |  LD      vmlinux.o
> |arc-linux-ld: gcc-10.1.0-nolibc/arc-linux/bin/../lib/gcc/arc-linux/10.1.0/arc700/libgcc.a(_muldi3.o): compiled for a little endian system and target is big endian
> |arc-linux-ld: failed to merge target specific data of file gcc-10.1.0-nolibc/arc-linux/bin/../lib/gcc/arc-linux/10.1.0/arc700/libgcc.a(_muldi3.o)

This is unrelated since original .config with CONFIG_ARC_PLAT_EZNPS would have
selected Big endina build, but you need a BE toolchain to get that working (since
libgcc emulation code still comes from toolchain).

> 
> Please update CI and ARC.

Nothing to update in CI. I'll send the ARC patch as a follow up.


> 
> Sebastian
> 

Thx for reporting.
-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
