Return-Path: <SRS0=51Ju=DF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420E1C2D0A8
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Sep 2020 21:45:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B4D206CA
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Sep 2020 21:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nvh9uDyp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O+arnYaX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="n63I6C4L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B4D206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0MvNJ5VwCSBA7es4MOoThtjJvWhmiXJ6QU3pk7IfXm4=; b=Nvh9uDypHb6dq3TQUj9/gwVz9
	5yIDrgYnIIwBnUfsR+mc41X4C9N9wbjKwt9XlYUFm9MAFZNsIqWc13Png6wpeMpHul73h29SvAShw
	p4V+jPJdHjoG+JP9DgLVL2rFEmkex2+iJooRlE2fwZBDT4d1zniYIbNCwrvA2PlCfh5or4gHeEVNd
	izyuM1Fm22BnrJWYFRaANgFgl9vMqGZ+xFENeYrwc8Ef9rS8fzQsGpNCBfGTl4fYxBuFNxPa0tC9T
	o4dTYzbIcyNQUgL08I46M68q19DJnfaC2KBPUL9nvhAIQnruUc5RSxqTAyAnIMZtGX/yJDDMTuVbi
	ZK5dsn+Qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN0xu-0000UI-5v; Mon, 28 Sep 2020 21:45:46 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN0xr-0000Te-1x
 for linux-snps-arc@lists.infradead.org; Mon, 28 Sep 2020 21:45:44 +0000
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com
 [10.192.0.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 873C34017E;
 Mon, 28 Sep 2020 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1601329540; bh=RhHwK4pjRyAdNum/cZnVehJE6tZI3uN+b56mL8PdSVc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=O+arnYaXe3QmS9tMPFF9+7jdKfQijToJ8UmU+FJ5z2/a80fcJMPK1uPcCnfpszwp1
 KS1LgfXzHP4mKVJtoHCAsaZh/jjhDKGhktHzedYMT8Q7lhmY0a4NLoaE+3XjOGRz6A
 1KaXQw4k8TvgIv89c/bcLLAUK9bDm3tuCJX/43djsXbAUuI3vfzyV+ZXiBHcnQrqSV
 QlQvkh53DsN8ToVTDKuscOb60WhSxCP3At7FifxHDeUFtTVFl+WWSAiZfmhRGMnWDC
 r3hoaHr+cL/RlVt7BnZqM2yqiOY6ZnszehnQTmFUFLAtj3IpCDBc5TsfliTsBQXCry
 mO3Wn4yMKGzGw==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C442CA0060;
 Mon, 28 Sep 2020 21:45:38 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id AF215400D6;
 Mon, 28 Sep 2020 21:45:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="n63I6C4L";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARz8CS6S/otsCgb7J7aytNNV4aWjVDR4C9d0RyqY1c8df8b3Ao43ykz5SjGk9Lsqf62XCj480P7jMJSnvF+124tiQuOOgO5atGQ5z/DszzYEFC9JgG0Ph1ElVEX8R0KoiXxkSjw5Nhfxm3XFmfFDgD9g2Y9nOzl4xhFUGwv+g31TD4Aqj8+9G7bkR3aDMd27hkWHgFk382rdatu+iHXDo+LLJr8H6qQvO2UIoLjs+uHpX7T89qXCs7GEE4KrHd6dDybuwlh0hPLMKzrxDhlyM5yLWUYvdAv9unOpWiVaItHRn5o1AdumUNbZbvRE9Yu73Fe+XIPTq8yer5d9nlugbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhHwK4pjRyAdNum/cZnVehJE6tZI3uN+b56mL8PdSVc=;
 b=GWrsBcQG8IVzC2VXqM8YviWOc89JzYIsDsm82VP8UI2kf2OrW4ZZob1aY7rLPUGg/QAtB6ijzD7OhCtsCmLiiuYzF0iMzefAeJKDEICLcZ/rqvuwKB/qW3e6KpbO/XF+DX9TysXdzKiLxS6b5iE+m/a62qqjXUjjaY39dQXehFYrY+apnsrjDGNh/+DKuBuw1MAQIs1NX9R3GPAvYaZdeF4dMGpIghqkzF/UTYerbI2t+T3R3bcGDU6PcJvCqys7sVVZ2WVxpEUsFWgO9DsuZPw92cOYAwgt/jXVBRng21tl+jkG54h0T4twgxEQ8iWK5Kxr9Xb0sRBUtKPb2JDXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhHwK4pjRyAdNum/cZnVehJE6tZI3uN+b56mL8PdSVc=;
 b=n63I6C4L8ZvZW1Ui82xImdF912E7TCJQi3QrcBNoTSAXK6gj8jBzk7MU0ZLeK3Gcljs6rJHanTqecH+gBllJ87h9VBQle09OHgSpPgEksmZTnbthiWwweENaplRAwi4K9GTnmQDGNV4bfOZxYyyo+4jROfkcOz/kxqU7FB1psbA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB4599.namprd12.prod.outlook.com (2603:10b6:a03:107::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Mon, 28 Sep
 2020 21:45:35 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0bb:1c2d:ecb9:547]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c0bb:1c2d:ecb9:547%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 21:45:35 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [arc:for-curr 1/3] arch/arc/Kconfig:100: can't open file
 "arch/arc/plat-eznps/Kconfig"
Thread-Topic: [arc:for-curr 1/3] arch/arc/Kconfig:100: can't open file
 "arch/arc/plat-eznps/Kconfig"
Thread-Index: AQHWldww/pwbZORsqk68oHfNUJcbM6l+laoA
Date: Mon, 28 Sep 2020 21:45:35 +0000
Message-ID: <baf318a6-1aeb-02b3-8753-24c883fdc97d@synopsys.com>
References: <202009290507.qo8zki0m%lkp@intel.com>
In-Reply-To: <202009290507.qo8zki0m%lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca788582-b33c-4d33-eb6b-08d863f7d508
x-ms-traffictypediagnostic: BYAPR12MB4599:
x-microsoft-antispam-prvs: <BYAPR12MB4599B6E00B80EC5430746C68B6350@BYAPR12MB4599.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:262;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ei82VjxCAON8OoAE8ZGvFE9NCkGZsbKPyFYcl+gBDosoIQoiTUw3Mhe4R2V5VkiZedsaFFpyLGb3qmjsOJzx5prClJEIJC1lMSK8wIQQp/UY6yPO42r3mNdepV2KAefRGfhAOw2RFPyf8zfc2FsJta/H1v2gUPslTBAM6JhqeiXEz0j9vvAUIV+9gAg0BG4TGHh4rqKtzBEwL456HtsqGJAqlDKgJUsmx+Clac5eaF8WRIzwnczGKMae0e9+4qnzBoyg4WPqvX10HIfMoWgPAOBbfM9pAhms7rERtlwJVDrLcAz3yK3ISBZjj2exTXCVNoHVSSIcifsAyPykL5/itK/mlMGh0EmbY2/KpD9CLU2a9m/P2x7gWwkBcpB/yi3I7A5aVnmBJCntrecW7TZSfYYLnreMQrH0RCU0pvxzAePsOzudKtaNjdT/R0AaHLyGuhQwESTcZmIhnHUmP72dstj1dRB5vOECEE2gKomK6nQD/HdC9jHiTT8Tr0ZnuPI6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(186003)(86362001)(2906002)(71200400001)(26005)(31696002)(478600001)(6486002)(66946007)(2616005)(83080400001)(4326008)(76116006)(8676002)(36756003)(966005)(64756008)(66446008)(316002)(8936002)(66476007)(66556008)(5660300002)(54906003)(53546011)(6512007)(6916009)(6506007)(31686004)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Oq7MJV3ilNGlBSWuc32AOLPZzy+77zVpZtjvB746IMpTNEvh+bqdGmnyXGgJMVsPNaAIHcy7flYGr0orJwHhWLzf39W9MWUuur4AwMZo2TWOI8quDxTGMD5PvxcgjmtY/PqX/hb+uOB5P4I7t00uj2hngaehc3G2oVWWhT1YCOW8oKSAOR+kc0maBfy1oA9Y8CNiH9WckOLmMBggyen4f21JicZG/6Go9G4Rw/zo0rK4qSfJ0bPKOsrJ87igLz8hjMmbAkA6LMUxMlfYQqQsWMEtPjdS/AUWdk+l3bvT/QsJJPpvpr8c6XmDzwvUCQ1HRE+wsDEzTWBerYKzqHw3IUmRHCB4R+DjxTz8ln0yQhGyJaa3JENZzeQsW7KB0JoGX/YOsPoezWSnt/VPTIHFBTIwO5FBxRQmf6azto07bBWJ9BYuOqaL2/7E4wxXcaFu6IQas5OU5CTCrXhsvNMYgg4VZGfuAcj2MOX4feieYD9opS0HEg72Lcuq6OO+GfQuuHCT9frWiyHFEhxm4wy1AKUiyaAT3bBVRKhcOfRcyVEq2rTEqiHzHpHwPZ+7G1YgQWq+o/z70vkLC2Eb3scpOyE0xxqdVvBCrzbkM29MiACVroPIa/Zc3/tWh2zKOdQLF4bsk9nM7rpiZIMvVIiHLA==
x-ms-exchange-transport-forked: True
Content-ID: <7F21F2381337004B99A8F1B5E8FC6BD3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca788582-b33c-4d33-eb6b-08d863f7d508
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 21:45:35.3789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMchTmqTW8caXI5bUtqvc9JLq0kLuxWmY8ZjtImNsESEGrHh2n2QjHO9piaSAfGqQsnfaBm2FHST3pXvaf5EUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4599
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_174543_578623_5F81AC78 
X-CRM114-Status: GOOD (  14.50  )
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
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 9/28/20 2:12 PM, kernel test robot wrote:
> tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git__;!!A4F2R9G_pg!J7R9L2xqRIoW5V3cOIMiGXYoTmnqfqsBeRF8a6mi5Z2erJKTrameivmPESLu6dm_$  for-curr
> head:   b18b6a1d2b82eb8a2e415e4b1fb1be9027353a5d
> commit: 2a8b4c7db0ccea1422545dfe3409a56c356dac58 [1/3] ARC: [plat-eznps]: Drop support for EZChip NPS platform
> config: arc-allyesconfig
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!A4F2R9G_pg!J7R9L2xqRIoW5V3cOIMiGXYoTmnqfqsBeRF8a6mi5Z2erJKTrameivmPEWJ9E75G$  -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/commit/?id=2a8b4c7db0ccea1422545dfe3409a56c356dac58__;!!A4F2R9G_pg!J7R9L2xqRIoW5V3cOIMiGXYoTmnqfqsBeRF8a6mi5Z2erJKTrameivmPEXTe-HI9$ 
>         git remote add arc https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git__;!!A4F2R9G_pg!J7R9L2xqRIoW5V3cOIMiGXYoTmnqfqsBeRF8a6mi5Z2erJKTrameivmPESLu6dm_$ 
>         git fetch --no-tags arc for-curr
>         git checkout 2a8b4c7db0ccea1422545dfe3409a56c356dac58
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc  allyesconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> arch/arc/Kconfig:100: can't open file "arch/arc/plat-eznps/Kconfig"

Thx. I had to squash the fix with original patch, but added Tested-by .

-Vineet
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
