Return-Path: <SRS0=oiN1=56=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F675C2BA19
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Apr 2020 19:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBCF12082E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Apr 2020 19:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vhygt4kC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JSoNt7tS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I2zjgng1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBCF12082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhtPgr+O2UjcN1sj/2skwRNzFTTYr3H5s80KmhAiC/w=; b=Vhygt4kCJBelAd
	GiiPI4arby3PhDraqHImBAv9slyvl8MSlMYSMcaxs/RO38t6960Ir+yHoWmoJvpqHyynmLECsYMGe
	1XAPCrzi3XqKu086h+Ww4+Bah2cGnz1SXWW9qfhgYSWAtfer//xJWzXJYBxRp7C6eXnF9qKcYCWwb
	UoKJs/hs+v0/VJgTvS/qLY9eBnMPVclow6V+2vyraFv97UsDlAJUl68r/qPHOcheyiRJmLdixz0un
	IR2kYepFsxPO75Sds+MIzuZcMM5XoyxFt2xLDyZpQ6bwFTzu52p+sy06yAu1TuEtgkUZ2DoOffcsP
	gpwYTnkm1ahUm4GGussQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOQvA-0001ZV-T9; Tue, 14 Apr 2020 19:08:32 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOQv7-0001Ys-RH
 for linux-snps-arc@lists.infradead.org; Tue, 14 Apr 2020 19:08:31 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9F354403B2;
 Tue, 14 Apr 2020 19:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586891307; bh=qd9je4MZ/pSvePmQEjqHwDQTuVI18kSy5tYdb/kJTrA=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JSoNt7tSsLzgYNBO109H+M3RPG7eOjqI/Esq4YkJ3ZdkvVc59aOZZj5Hebu2RC+tX
 iAgEJWn/lNYTt9Rcop3iv85hrZTi8DCmFhKlhuAHKp4G7r0bNOEYbAVUnMxscmZl/5
 TpYwiidqhDq0SwH/QeO9UvlZOC6P1WWTkqrYWUNzJH/AVYnFAQLvrVmCSVAYNvg+Z2
 6if10p9zuWSY6VLurZdELNIGWO74N005RLylwNM0ImNMB+u0/8mEKVnlQvpwE7BIxp
 FKNEOrd5J3F5sLMOrvlBNHxTw/1Mn3THBYSTyUG6yUSuIeNPsoQm5/adpCIjpkIW6k
 hsJW6WUEIKxpg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D6109A00B0;
 Tue, 14 Apr 2020 19:08:24 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 Apr 2020 12:08:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 14 Apr 2020 12:08:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP1JqCmhf5plK2F4cKac8Z08v4pXQDBfqIhcOsvRgznpfYL0esDznrwKgdwhswulPPI0b0Gvz+FLwV1N/1+ohPOKf3j/oPcWzxBT10jlJ/+Gp6sCwQfRLqwHjES/SFa4C+fzQs4jVKT3Ukz89vne3KKdaz0wbDE/vqs1lSexdyZmHpcCN4QYYGOOx/hAvFE13xBceQ7aBbSSpvyDGN81fHqgYJEwVEgS6Qh/0hKhlE0PZ+/83gYJn8C7fCwNX69vppHY5Qw1p936djK8rzFIKDgAp2IBP2yUzgA0ujD+ZSXu4DPAV5VPiiT0F7aUHCT/cqhrA7QiASLPLGFPf6FoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gjrqBjNwE5JRGvSyXyhnyasJGBfKgWNFkrNlPsr4Ak=;
 b=k+mizg7nmAFYCJK2hzClDmNIUmX8ELnIi712yckVUt/YgGCiUfg7iyheWmN+vmd6/mtUtTDmOtGl37t2i3K88U1KSIsxd+0+5U+LtlObIYc9QegzjJ8btE0Gn+cJ/TfpNVEN7G6j2sTkT2qkBAN+D2gxqTra5f2TMEWNLjJFtb6thteJTojFb3cr6dMNOvnXZmk0I+l0AaIWghueyuOlqqnnxLmPhpQJPpCEsZvdleVMTCf6S7wSgZuwsOjjFMqLLT1GpaNuas3x/k9mqi8XBIhfnDXGZRisOL31ucmIl27b/5iIClH67EhbQne+7d3bR8Kk26yVX7HuNhrrbZEUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gjrqBjNwE5JRGvSyXyhnyasJGBfKgWNFkrNlPsr4Ak=;
 b=I2zjgng1rx/HUSuN8niDv8IeK6WmHVhiRWpKyvXoWfs8qAMx3/eSsqgP1rx6Fh8MZAStsCNSW+7C63RiYV+8CD/+S2LJU5vx7eRlK3Ta55O+fgpGsfFEoX1wB1iXrtFtXnmdIlxpGaF0nGVHMZwEGL3/29UvY17bCMtoY3QlkK0=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (2603:10b6:a03:db::25)
 by BYAPR12MB2903.namprd12.prod.outlook.com (2603:10b6:a03:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.24; Tue, 14 Apr
 2020 19:08:22 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::a45a:6a41:3fe5:2eb7%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 19:08:22 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: kbuild test robot <lkp@intel.com>
Subject: Re: [arc:topic-zol-remove 21/22]
 arch/arc/include/asm/atomic-nps.h:90:21: error: 'CTOP_INST_AADD_DI_R2_R2_R3'
 undeclared
Thread-Topic: [arc:topic-zol-remove 21/22]
 arch/arc/include/asm/atomic-nps.h:90:21: error: 'CTOP_INST_AADD_DI_R2_R2_R3'
 undeclared
Thread-Index: AQHWEkN5qnVGNUtNqkqwbHIYGVS91ah4+5gA
Date: Tue, 14 Apr 2020 19:08:22 +0000
Message-ID: <4776646a-7f3c-7400-8740-c0428cedcb1d@synopsys.com>
References: <202004141717.5T2t0aQt%lkp@intel.com>
In-Reply-To: <202004141717.5T2t0aQt%lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [2601:641:c100:83a0:7c06:2fd:ae14:dd9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2560815-5d69-4cfc-b0f3-08d7e0a7337f
x-ms-traffictypediagnostic: BYAPR12MB2903:
x-microsoft-antispam-prvs: <BYAPR12MB29031A1210B59434D79B2403B6DA0@BYAPR12MB2903.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:109;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3592.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(376002)(346002)(136003)(39860400002)(366004)(66476007)(66946007)(81156014)(76116006)(66556008)(31696002)(478600001)(6916009)(4326008)(966005)(64756008)(6506007)(6512007)(2616005)(53546011)(86362001)(66446008)(2906002)(6486002)(186003)(31686004)(54906003)(36756003)(8936002)(8676002)(316002)(83080400001)(71200400001)(5660300002);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zL9LT7k3AvGFst2fdELnD3pqjSX5PA5YELtUNifD8huGPlo3TgQNpEIe1ESAUMiqya5QHy/DjgRdHpIWyav20/r+3qNX2al3mHsagRbGnDCP0j3OFKKHYVddV2RiFVOpx/98aK4/U3+OXKGlWfR9uSXjo2sME36Xbt7JxHOoGhMq0zQ00OBKH5Dg8k6KFL9J5RchzoqFLSzOIYjpzOyhV8J3nCc32qWOf2gIhZ8Yz6iFksgwGho+RBuAKlYHkFICeDCMVUtvoowLG+illMTMAj7fpRiNjJgko6txsXNZeDh9Us5jvBKsVZrWEulTcwgv4AbjupcTS+Q5xPO1RJ2ap2js9Xez7GDGWzQtZfYGhV+EOVggKaqm1GCwaIhLs2ft6ALo3duRmi0e52+QX6uTMFV8CjdyIY7fTwrGymEc16/cu/BnqaZ309c9GCD6LFCk5ao71ovHZmitvbBAJYf+Ev+i4vk0/Q5WaW0BH2Yol4s9KzVLFQ07dDttYglUz+AAMMky+MdiljmC1K2ipVh3GQ==
x-ms-exchange-antispam-messagedata: eCl0LMZTWm2Mi9HVNNlC84/FVD5gTAtU8Wi92WSAgbMScD39AO22ggO6XxVFZYxkWcGuEXhZraerdzuU9AyVYmWKtf5Z6wsqsvleXgIPsfS7bImfpHBa7npm+j57WbGiyHVmV352nSuyG51OLCXa2okTXc77Pi7sPhYVKqBzb59PDyfc5e6tnEZY+i+BnxJKYylPnvnSwEFOrF61Xc9iKA==
x-ms-exchange-transport-forked: True
Content-ID: <31CBCD2120ED9B409E3B44DAA3B520FC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a2560815-5d69-4cfc-b0f3-08d7e0a7337f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 19:08:22.2802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8uwWQyiwMqQeyQE3EDR56PwJq2I+dzEsIO9vfDvWWdEtoY5UcAgJE0Z/TSUxR0vfmtAukbxYOtLbF+0xKLoVLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2903
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_120829_956930_101455CB 
X-CRM114-Status: GOOD (  10.67  )
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

On 4/14/20 2:53 AM, kbuild test robot wrote:
> tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git__;!!A4F2R9G_pg!JHhMNLW-tNUCo4YMz0RhKnmtfBcXYGKoAKqM4WMLnpaPUzVsWRMue3d_lHcJfgSTZTr2Dw$  topic-zol-remove
> head:   a8a3f635306d6df3190880d1fd2fc32e55ba58af
> commit: 690740e20ee5dd78c913116dd41593fc59dd9652 [21/22] ARC: atomics: break off header off for specific platforms
> config: arc-allyesconfig (attached as .config)
> compiler: arc-elf-gcc (GCC) 9.3.0
> reproduce:
>         wget https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!A4F2R9G_pg!JHhMNLW-tNUCo4YMz0RhKnmtfBcXYGKoAKqM4WMLnpaPUzVsWRMue3d_lHcJfgT-WaZnYg$  -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 690740e20ee5dd78c913116dd41593fc59dd9652
>         # save the attached .config to linux build tree
>         GCC_VERSION=9.3.0 make.cross ARCH=arc 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>

Thx for the report. Although the error was triggered in a topical branch, mainline
fails similarly.
A fix is now pushed to for-curr

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
