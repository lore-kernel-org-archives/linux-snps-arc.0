From: ross.burton@intel.com (Burton, Ross)
Date: Fri, 21 Sep 2018 11:43:21 +0100
Subject: [OE-core] [PATCH v2 5/9] libgpg-error: Add ARC support
In-Reply-To: <20180920204232.10583-6-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
 <20180920204232.10583-6-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 20 Sep 2018 at 21:44, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:

>         case ${TARGET_ARCH} in
>           aarch64_be) TUPLE=aarch64-unknown-linux-gnu ;;
> +         arc)        TUPLE=i686-unknown-linux-gnu ;;
>           arm)        TUPLE=arm-unknown-linux-gnueabi ;;
>           armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
>           i586|i686)  TUPLE=i686-pc-linux-gnu ;;

Is that right?  Just saying, it looks wrong...

Ross
