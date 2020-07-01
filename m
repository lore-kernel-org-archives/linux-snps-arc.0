Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41CAC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 20:59:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 623862082F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 20:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="njOrUgBl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kF8mYfpW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fmx/y6/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 623862082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A9blG1zYMUtu8LUAgV9ViIUY+LGJXuPwh+GFVvKASsw=; b=njOrUgBlQKXRZu3au46Iy+Wdl
	DzaIbap1J6Y26Axyyyuh/FGWXHhb4hfR0f0KZijW2bf2Hz0mdvyEPitr/KxXtUcTxLD10lNzcbDHi
	83awNlAO8lgKWE7Qnqfq4ri/ut5OAUaC+/T4vd36GHf2Lho8C120RlPN5zknwE90pTI+e95GmeP5m
	BVjplXxYas1uKQlOl+h/fBJlfSY+dmY9l/v/PkV23ck+M9R/3mSJfZd3eI9LsbrBoeNGFbd1wfHvO
	+Dykz/qaZPu443ap/uofECtpjWAKcVfwcgKuMp3fWF6SBNYmILcpTfFqw8P9jCpD21bG8SMaWkL21
	TXqf460/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqjpk-00008K-Nq; Wed, 01 Jul 2020 20:59:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqjph-00007v-BP
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 20:59:54 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 861F6C0113;
 Wed,  1 Jul 2020 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593637191; bh=clSwLl5lTGw9JrcGGioZyvmU0VGX/5btHvtaIW1TWvo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=kF8mYfpWCH2NRO7JADqUS6RCytEXH8E5R4m86YJDERrwB+dkeBJNh6/ctoUCNtPbL
 VwCIEB1ypHq1ZWilAz4TnhUZ8tAr/aCoL2b8U3S50pReFTiTkwxZxfgyJ8JhhIi79D
 4d/yny+YTdDCody09MFn4QluqcDAZpq5Uf8n5AU4iqGXoDDCTCnx/ELUbfNZIWwhBF
 NaSZTbqo4zU0p+QHVxKsWJe07U6ZOyWiP8lJTeusLkZhf6S5I0YwhYD/X+pH6NaANS
 nbbfeoq2MH35wGenadFKk3+rExXocAd6mOqc74IsSq3/54DJjwYqDmXWPvVRB3MjSh
 jv9/ElN0lcuXg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id BA625A00A2;
 Wed,  1 Jul 2020 20:59:46 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id DC83E80028;
 Wed,  1 Jul 2020 20:59:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="fmx/y6/7";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQTuUNucmDeQt6gB8/v7GZnWrls2kT279006+Nm4otyuSzbhWtmEgoQ9GUjAPaKcdPXm5mrUOg1hCrgQ3RgdJ5RNwm2UMdilMK8DXQ/YjzIDYvbIKKcfKP8/DL7NGnD0CY97OdAgys2rUEOQz+VoBqOLzFIxNOag8YyRXR60EQCUDsg7XAjuvY/lYhMqd0Yh6dd0URsbhnan18PzOuaxwVGXecQQePL4OWmoMRn7h8MMN/ZkR8dkMBDl/dvWBbyG5ye4zeXOTlbgXNeUoHyT1gMhgkSy+o42zoe6oZP3AZDT0MzpgcPWAyKApcVYJx75oSkVIe9W+wqn+eluLl14PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clSwLl5lTGw9JrcGGioZyvmU0VGX/5btHvtaIW1TWvo=;
 b=KshOGFbfAFq1lWcSSYIAsA5QaiGy5xK6lJ5dY3w85ll874lBvxdJkEdYEhlWdGogu/7B7VSNdtF4rNbiPUD9G+44rlKqPT25rxOmk7EDXOj6GzebyNFc6Mz7D+c/qmWzA8jOu5YUUWieGz6ZlTh42lh31XhnVGVJgGQv95E9UeZvVrWtqPNBYxV/cmjnLueuuzCQfbTD1ADwUq7CiGTHOMqwV+Ks7+3uSwXBYKuT2lwrOui2l3ur/A82bUjSgO4PodKH1P2Wr9G8TrPH0j1hmLEBnbUhGGi7odSA/7jYt9f+2wKL2bd02dSUPd2uBOnQnwUP05Q0qJfSNPcP2E+rSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clSwLl5lTGw9JrcGGioZyvmU0VGX/5btHvtaIW1TWvo=;
 b=fmx/y6/7Ycsv3wZHE7eaC3gsZSxWFy8BjKRRjjrs4hFrWJ42G0LQmt+HgNqEZoqRlvLeVGNz/psx0JQx0Z0RQgXwOZDeSswIDsVzUAh14IB1oy0ibP/+KieBowJxIjmfQgi6OiDxsEcidDFxkfsksltH6uu4ZcR0gW2ifrG/pmA=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:65::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.26; Wed, 1 Jul
 2020 20:59:42 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3153.020; Wed, 1 Jul 2020
 20:59:42 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>, Alistair Francis
 <alistair23@gmail.com>
Subject: Re: [PATCH 7/7] sysv: linux: Add 64-bit time_t variant for shmctl
Thread-Topic: [PATCH 7/7] sysv: linux: Add 64-bit time_t variant for shmctl
Thread-Index: AQHWT+qKWkJL3B0MmUKEbRV3bjPjKQ==
Date: Wed, 1 Jul 2020 20:59:42 +0000
Message-ID: <86dd9e69-6748-05d5-2765-cd271028a3c0@synopsys.com>
References: <20200630192441.3299710-1-adhemerval.zanella@linaro.org>
 <20200630192441.3299710-7-adhemerval.zanella@linaro.org>
 <CAKmqyKORVHfYcRR6kK9uy60Ff0u-prPsWjts6v2QM4Jt9xgMtg@mail.gmail.com>
 <9db39d52-89a5-3411-c210-50b1648fbb09@linaro.org>
 <CAKmqyKNV1wmGwEF49oFCPmxDe=69f+_Up_DbWhHKQaVknKqaWw@mail.gmail.com>
 <aaeb295f-6802-e6b4-ccd9-a05672ed95c6@linaro.org>
 <ab475227-213f-2b97-e787-a0958cf7a4fc@linaro.org>
In-Reply-To: <ab475227-213f-2b97-e787-a0958cf7a4fc@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [2601:641:c100:83a0:fee2:8ed0:e900:96d1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5409b065-aa0f-440a-99cd-08d81e01ad66
x-ms-traffictypediagnostic: BYAPR12MB2712:
x-microsoft-antispam-prvs: <BYAPR12MB2712D6E4750BD214E37920C9B66C0@BYAPR12MB2712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:177;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M4g8zUF3otgFCsn/npO8grpUVBnb6q0WImQXd9PoJ8frDoEQuuy2ZNaMF5IJo7NTt51FfgKJvJImdqcLxgV+pkwbkqUZ8SxXRIpYv9ro46y5xcZgTaaNfKV0eBq4j/Am7ZHlFVP5Rp5rgtp/kUbtDOzsV3J/05YKHI81++CxUANXa2E/s2Xq5MD6ohZWORP8abmIJuE3asJiNV76LwQF9nrqbgB5vcd2CVOxFyBVeXZvqvMThhIseLQzwWePZdi3OKcdv6jC+Iij7bRbDUm+qZtCRrFLNqbga0IpAdELSfzfG9s5ydQ4PVyphPkw5sZlwsfyDMnS7Kz3vVsxiREusKuVnNhkf4zZh6yHbxOLg7UIe4iImgS1UFCuWu14lw3eVCpUqEp2lqmjEq7nS1hxbNk7RulO5QRFmH0oCBgwWmm191duTb/lldDl1Tli74DmT7PF/YB1rf1YRI7hzDazx0lYXCelr+GD9urPCkq3GY8UmDDhNiLveXnwbFW/uorM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(346002)(376002)(396003)(136003)(6486002)(4326008)(66476007)(2906002)(66946007)(8936002)(8676002)(2616005)(66446008)(64756008)(5660300002)(6512007)(76116006)(66556008)(86362001)(110136005)(31696002)(53546011)(316002)(186003)(83380400001)(54906003)(4744005)(71200400001)(6506007)(478600001)(31686004)(966005)(36756003)(17423001)(156123004)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: sOD6AygICTJZzzKiSkbTLuIHXkYmwR5JIilrpuZajslwxRjWSS6v7URiEpDQW2n8/IpdadnQxRU9FfHdd9zeb6BvrzQSd6B9hR6fk2k59zVhPeS+B48yVc9P5Pnd+sSCRnlj+ZQlQ/VkQ4a7l27cjKZSVJbsKX3SwRRZFXUY4OvbmqUZlB0zW/LVecMupibeQEoIJVmNE06iNOmnqwnvW/03r8so4GxHnTAD0gjSl/tCBwTh+1oNGeeUEcvlVLpRy0o0zIJiLsu76JNptl+2KPek9JwAnelorcI0HDZbURgQJkkO7PHkshkMcSAYG5ropLvuWgHngCZAHKXOUfoGGoBdaxfhuymWhN/tF8VbeMDgsQ55TEOQyuOFXoQOuOvDGI+aXp81kyv1ET9LEPViWSLKEXjRp21D7WsbgUnO5C3d11SPdkdfovJl86krNYlgEQrcIvn2UajHJGHDPrFoFf07YRTv5u0snVL7DmOzQ3XF7dkZe5iIZdpAmnXx/gupPTR0yTR1mHnVOQLApB808r9VtWiEqFu+LOZs2+ztCUWS/DYlzMVhhDJsWAo/VK7g
x-ms-exchange-transport-forked: True
Content-ID: <60D4942E04C6DB41B271DA3389F9203A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5409b065-aa0f-440a-99cd-08d81e01ad66
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 20:59:42.3929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 543FhaCuiL3OtoisXkRk0ML0qP3Msm4PC7mNZ321SCL6PKRn5dNtxWZc3xdDE4I08gfHvUu1S9hUEQbritYucA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_165953_890264_84EE10E4 
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
Cc: Stepan Golosunov <stepan@golosunov.pp.ru>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 7/1/20 10:07 AM, Adhemerval Zanella via Libc-alpha wrote:
>> Ack, you can also do a sniff test with the sysvipc tests to check if
>> they are ok.
> 
> Ok, the __TIMESIZE should not be used to define the kernel_* struct anyway,
> they should be independent of the glibc time ABI selected or defined by
> the ABI.
> 
> I have updated my personal branch [1] with an updated version and I will
> try to check if riscv32 at least built against. If you could also check
> it would be helpful.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=shortlog;h=refs/heads/azanella/semctl-y2038

I've rebased ARC port on this (dropped the prior versions from rv32) and these
seem to work !

| PASS: sysvipc/check-installed-headers-c
| PASS: sysvipc/check-installed-headers-cxx
| PASS: sysvipc/check-obsolete-constructs
| PASS: sysvipc/check-wrapper-headers
| PASS: sysvipc/test-sysvmsg
| PASS: sysvipc/test-sysvsem
| PASS: sysvipc/test-sysvshm

FWIW: Tested-by: Vineet Gupta <vgupta@synopsys.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
